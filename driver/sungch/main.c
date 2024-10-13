#include <linux/module.h>

static int __init sungch_module_init(void)
{
    printk(KERN_DEBUG "%s\n", __func__);
    return 0;
}

static void __exit sungch_module_exit(void)
{
    printk(KERN_DEBUG "%s\n", __func__);
}

module_init(sungch_module_init);
module_exit(sungch_module_exit);

MODULE_AUTHOR("jc3wrld999@gmail.com");
MODULE_DESCRIPTION("sungch driver");
MODULE_LICENSE("GPL v2");