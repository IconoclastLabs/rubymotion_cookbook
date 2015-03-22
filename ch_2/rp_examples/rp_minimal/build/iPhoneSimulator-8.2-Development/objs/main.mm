#import <UIKit/UIKit.h>

extern "C" {
    void rb_define_global_const(const char *, void *);
    void rb_rb2oc_exc_handler(void);
    void rb_exit(int);
    void RubyMotionInit(int argc, char **argv);
}
int
main(int argc, char **argv)
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    int retval = 0;
    RubyMotionInit(argc, argv);
    retval = UIApplicationMain(argc, argv, nil, @"AppDelegate");
    rb_exit(retval);
    [pool release];
    return retval;
}
