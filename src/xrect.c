/* xrect - interactively select a rectangle and output as geometry string

   Usage: xrect [-w] [-x SCALEX] [-y SCALEY]
     -w selects window sizes with a single click, instead of just a coordinate
     -x -y divide the size for use with line/column geometries


   This program is lifted from scrot(1) code:

   Copyright (C) 1999, 2000 Tom Gilbert
   Copyright (C) 2013 Christian Neukirchen

   Permission is hereby granted, free of charge, to any person obtaining a copy
   of this software and associated documentation files (the "Software"), to
   deal in the Software without restriction, including without limitation the
   rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
   sell copies of the Software, and to permit persons to whom the Software is
   furnished to do so, subject to the following conditions:

   The above copyright notice and this permission notice shall be included in
   all copies of the Software and its documentation and acknowledgment shall be
   given in the documentation and software packages that this Software was
   used.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
   THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
   IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
   CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <X11/Xlib.h>
#include <X11/cursorfont.h>

Window
get_window(Window root,
           Display * display,
           Window window,
           int x,
           int y)
{
  Window source, target;

  int status, x_offset, y_offset;

  source = root;
  target = window;
  if (window == None)
    window = root;
  while (1) {
    status =
      XTranslateCoordinates(display, source, window, x, y, &x_offset,
                            &y_offset, &target);
    if (status != True)
      break;
    if (target == None)
      break;
    source = window;
    window = target;
    x = x_offset;
    y = y_offset;
  }
  if (target == None)
    target = window;
  return (target);
}


int
main(int argc, char *argv[])
{
  int rx = 0, ry = 0, rw = 0, rh = 0;
  int rect_x = 0, rect_y = 0, rect_w = 0, rect_h = 0;
  int scale_x = 1, scale_y = 1;
  int btn_pressed = 0, done = 0, wflag = 0;
  int opt;
  Window target = None;
  XEvent ev;

  while ((opt = getopt(argc, argv, "wx:y:")) != -1) {
    switch (opt) {
    case 'w':
      wflag = 1;
      break;
    case 'x':
      scale_x = atoi(optarg);
      break;
    case 'y':
      scale_y = atoi(optarg);
      break;
    default:
      fprintf(stderr, "Usage: %s [-w] [-x SCALEX] [-y SCALEY]\n", argv[0]);
      exit(-1);
    }
  }

  Display *disp = XOpenDisplay(NULL);

  if(!disp)
    return 1;

  Screen *scr = NULL;
  scr = ScreenOfDisplay(disp, DefaultScreen(disp));

  Window root = 0;
  root = RootWindow(disp, XScreenNumberOfScreen(scr));

  Cursor cursor, cursor2;
  cursor = XCreateFontCursor(disp, XC_left_ptr);
  cursor2 = XCreateFontCursor(disp, XC_lr_angle);

  XGCValues gcval;
  gcval.foreground = XWhitePixel(disp, 0);
  gcval.function = GXxor;
  gcval.background = XBlackPixel(disp, 0);
  gcval.plane_mask = gcval.background ^ gcval.foreground;
  gcval.subwindow_mode = IncludeInferiors;

  GC gc;
  gc = XCreateGC(disp, root,
                 GCFunction | GCForeground | GCBackground | GCSubwindowMode,
                 &gcval);
  XSetLineAttributes(disp, gc, 2, LineSolid, CapButt, JoinMiter);

  /* this XGrab* stuff makes XPending true ? */
  XGrabPointer(disp, root, False,
		  ButtonMotionMask | ButtonPressMask | ButtonReleaseMask, GrabModeAsync,
		  GrabModeAsync, root, cursor, CurrentTime);

  XGrabKeyboard (disp, root, False, GrabModeAsync, GrabModeAsync,
		  CurrentTime);

  while (!done) {
    while (!done && XPending(disp)) {
      XNextEvent(disp, &ev);
      switch (ev.type) {
      case MotionNotify:
        /* this case is purely for drawing rect on screen */
        if (btn_pressed) {
          if (rect_w) {
            /* re-draw the last rect to clear it */
            XDrawRectangle(disp, root, gc, rect_x, rect_y, rect_w, rect_h);
          } else {
            /* Change the cursor to show we're selecting a region */
            XChangeActivePointerGrab(disp,
                                     ButtonMotionMask | ButtonReleaseMask,
                                     cursor2, CurrentTime);
          }
          rect_x = rx;
          rect_y = ry;
          rect_w = ev.xmotion.x - rect_x;
          rect_h = ev.xmotion.y - rect_y;

          if (rect_w < 0) {
            rect_x += rect_w;
            rect_w = 0 - rect_w;
          }
          if (rect_h < 0) {
            rect_y += rect_h;
            rect_h = 0 - rect_h;
          }
          /* draw rectangle */
          XDrawRectangle(disp, root, gc, rect_x, rect_y, rect_w, rect_h);
          XFlush(disp);
        }
        break;
      case ButtonPress:
        btn_pressed = 1;
        rx = ev.xbutton.x;
        ry = ev.xbutton.y;
        target = get_window(root, disp, ev.xbutton.subwindow, ev.xbutton.x,
                            ev.xbutton.y);
        if (target == None)
          target = root;
        break;
      case ButtonRelease:
        done = 1;
        break;
      }
    }
  }
  /* clear the drawn rectangle */
  if (rect_w) {
    XDrawRectangle(disp, root, gc, rect_x, rect_y, rect_w, rect_h);
    XFlush(disp);
  }

  if (rect_w > 5) {
    rw = ev.xbutton.x - rx;
    rh = ev.xbutton.y - ry;
    /* cursor moves backwards */
    if (rw < 0) {
      rx += rw;
      rw = 0 - rw;
    }
    if (rh < 0) {
      ry += rh;
      rh = 0 - rh;
    }
  } else {
    Window child;
    XWindowAttributes attr;
    int stat;

    /* without -w, just output the mouse click location. */
    if (!wflag) {
      printf("+%d+%d\n",rx,ry);
      XBell(disp, 0);
      XCloseDisplay(disp);
      exit(0);
    }

    /* else it's a window click */
    /* get geometry of window and use that */
    /* get windowmanager frame of window */

    if (target != root) {
      unsigned int d;
      int x;
      int status;

      status = XGetGeometry(disp, target, &root, &x, &x, &d, &d, &d, &d);
      if (status != 0) {
        Window rt, *children, parent;

        for (;;) {
          /* Find window manager frame. */
          status = XQueryTree(disp, target, &rt, &parent, &children, &d);
          if (status && (children != None))
            XFree((char *) children);
          if (!status || (parent == None) || (parent == rt))
            break;
          target = parent;
        }

        /* Get client window. */
        /* if (!opt.border) */
        /*   target = scrot_get_client_window(disp, target); */
        //XRaiseWindow(disp, target);
      }
    }
    stat = XGetWindowAttributes(disp, target, &attr);
    if ((stat == False) || (attr.map_state != IsViewable))
      return 1;
    rw = attr.width;
    rh = attr.height;
    XTranslateCoordinates(disp, target, root, 0, 0, &rx, &ry, &child);
  }

  if (rx < 0) {
    rw += rx;
    rx = 0;
  }
  if (ry < 0) {
    rh += ry;
    ry = 0;
  }
  /*
  if ((rx + rw) > scr->width)
    rw = scr->width - rx;
  if ((ry + rh) > scr->height)
    rh = scr->height - ry;
  */

  XBell(disp, 0);
  XCloseDisplay(disp);

  printf("%dx%d+%d+%d\n",rw/scale_x,rh/scale_y,rx,ry);
  return 0;
}

//  size+offset
// 11x10+874+279

