Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x242.google.com (mail-pa0-x242.google.com
 [IPv6:2607:f8b0:400e:c03::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C93871A0174
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2016 14:54:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=JBSSEOvv; 
 dkim-atps=neutral
Received: by mail-pa0-x242.google.com with SMTP id pv5so8673921pac.0
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jan 2016 19:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding;
 bh=/ExZBktZm8xiov0Drpbzp926vMTcAk5rQRpS3rzxdAk=;
 b=JBSSEOvvTxjwPqtkv+4IoC8TfVL1xAyJEOvd6O9QEyWHkne3Wm923JlFMkhZKIXRzj
 uWm9SEfMGcO5UsLqHshjqxEeTJJM9lq3qbzhjP6xcFFbXXIOa82MvMv7xR9kskVQrY6u
 r/tFH081W8z2F4zHrR9O5rW9p0kR/9S9oWSoeipP2karIYCHMvoYR53P28cF6/SIg7zl
 HBQsLsLR38ufDz6XWTPG3X4x2ejzU95tCYGHojo4IzssmmfZ6SY6CT1sRogsVlYRck7g
 h1p+buneQ37d+Yd48odEhTGagqGPeLq2DgI7XHStHIB8tT/iKq46W8nP2DFkX3VGmI42
 FJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-type:content-transfer-encoding;
 bh=/ExZBktZm8xiov0Drpbzp926vMTcAk5rQRpS3rzxdAk=;
 b=Y5yga+gXk4uBXRqbIfYrztuwtB+zXIHRvYz3z57wQTGYqbD5TzemaSM94Pjh/hFy1R
 sgvoZ9YrwjFsoij3sGjlGP/q9PuY8uIswlcR0BF7BqYbckjMcCWF6QKDRmt48f7mozuP
 zXaG1GXQW3ws3MJiiv5ld15Q+ST1doyP2xtP8Fz1ecpWSRZkubndf28uTgygDbq5yia0
 Et8Yp19dlkg5OW8woov9WgECMjKDAszfRa28ti/33IPRMtLCCDpN1srpsy8SuPe9PBP2
 OTA3CCYjDapqMjl5bsqA63tTj0ZVERwB8JqdM9snQJo4Uu59bNb0wAyizUOMhwr4oOCK
 xEbw==
X-Gm-Message-State: AG10YOQSxiTGn0CkspAYTPcmI5Bm2KdEgqwIzymWDSVsEtn5Uas65Qw8mPQRZXObH8dGjg==
X-Received: by 10.66.54.102 with SMTP id i6mr13574249pap.71.1453866865662;
 Tue, 26 Jan 2016 19:54:25 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id fc8sm4947075pab.21.2016.01.26.19.54.23
 (version=TLSv1/SSLv3 cipher=OTHER);
 Tue, 26 Jan 2016 19:54:25 -0800 (PST)
Date: Wed, 27 Jan 2016 14:54:16 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, vishwanath@in.ibm.com
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH skeleton v2] Refactored LED control dbus methods
Message-ID: <20160127145416.6569f93b@camb691>
In-Reply-To: <1453465242-8067-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453465242-8067-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453465242-8067-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.29; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jan 2016 03:54:28 -0000

On Fri, 22 Jan 2016 06:20:42 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: vishwa <vishwanath@in.ibm.com>

Hi Vishwa,

Thanks for your work, I've put a few comments inline below

> 
> ---
>  Makefile                     |   5 +-
>  objects/led_controller_new.c | 448 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 452 insertions(+), 1 deletion(-)
>  create mode 100755 objects/led_controller_new.c
> 
> diff --git a/Makefile b/Makefile
> index ea2dde2..bdf619a 100755
> --- a/Makefile
> +++ b/Makefile
> @@ -22,7 +22,7 @@ LIBS=$(shell pkg-config --libs gio-unix-2.0 glib-2.0) -Llib -lopenbmc_intf
>  %.o: objects/pflash/libflash/%.c
>  	$(CC) -c -o obj/$@ $< $(CFLAGS) $(INCLUDES)
>  
> -all: setup libopenbmc_intf power_control led_controller button_power button_reset control_host host_watchdog control_bmc board_vpd pcie_slot_present flash_bios flasher control_bmc_barreleye pflash hwmons_barreleye
> +all: setup libopenbmc_intf power_control led_controller button_power button_reset control_host host_watchdog control_bmc board_vpd pcie_slot_present flash_bios flasher control_bmc_barreleye pflash hwmons_barreleye led_controller_new
>  
>  setup: 
>  	mkdir -p obj lib
> @@ -39,6 +39,9 @@ power_control: power_control_obj.o gpio.o object_mapper.o libopenbmc_intf
>  led_controller: led_controller.o gpio.o object_mapper.o libopenbmc_intf
>  	$(CC) -o bin/$@.exe obj/gpio.o obj/led_controller.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
>  
> +led_controller_new: led_controller_new.o
> +	$(CC) -o bin/$@.exe obj/led_controller_new.o $(LDFLAGS) $(LIBS) -lsystemd
> +
>  button_power: button_power_obj.o gpio.o object_mapper.o libopenbmc_intf
>  	$(CC) -o bin/$@.exe obj/button_power_obj.o obj/gpio.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
>  
> diff --git a/objects/led_controller_new.c b/objects/led_controller_new.c
> new file mode 100755
> index 0000000..25ea45b
> --- /dev/null
> +++ b/objects/led_controller_new.c
> @@ -0,0 +1,448 @@
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <errno.h>
> +#include <string.h>
> +#include <dirent.h>
> +#include <systemd/sd-bus.h>
> +
> +// These are control files that are present for each led under
> +// '/sys/class/leds/<led_name>/' which are used to trigger action
> +// on the respective leds by writing predefined data.
> +const char *power_ctrl = "brightness";
> +const char *blink_ctrl = "trigger";
> +const char *duty_on   = "delay_on";
> +const char *duty_off  = "delay_off";

Why can't these be #defined?

> +
> +//--------------------------------------------------
> +// Given the dbus path, returns the name of the LED
> +//--------------------------------------------------
> +char *get_led_name(char *dbus_path)
> +{
> +    char *led_name = NULL;
> +    char *token = NULL;
> +
> +    // Get the led name from /org/openbmc/control/led/<name>
> +    token = strtok(dbus_path, "/");
> +    while(token != NULL)
> +    {
> +        led_name = token;
> +        token = strtok(NULL, "/");
> +    }
> +
> +    return led_name;
> +}

The way you've written it should work but am I missing something or
can it not simply be:

char *get_led_name(char *dbus_path)
{
	char *pos;

	pos = strrchr(dbus_path, '/');
	if (pos)
		pos++;

	return pos;
}

> +
> +//-------------------------------------------------------------------------
> +// Writes the 'on / off / blink' trigger to leds.
> +//-------------------------------------------------------------------------
> +int write_to_led(const char *name, const char *ctrl_file, const char *value)
> +{
> +    // Generic error reporter.
> +    int rc = -1;
> +
> +    // To get /sys/class/leds/<name>/<control file>

What if /sys is mounted elsewhere?

> +    char led_path[128] = {0};
> +
> +    strcpy(led_path, "/sys/class/leds/");
> +    strcat(led_path, name);
> +    strcat(led_path, "/");
> +    strcat(led_path, ctrl_file);

I too often do this and then I remember snprintf() :). The problem with doing
what you've done here is that you could potentially overflow led_path without
knowing it.

int len;

len = snprintf(led_path, sizeof(led_path), 
	       "/sys/class/leds/%s/%s", name, ctrl_file);
if (len >= sizeof(led_path) {
	fprintf(stderr, "Error LED path is too long for buffer");
	return rc;
}

or another approach which avoids the possibility of led_path being too small is
asprintf(), but still leaves you open to memory allocation failures...

char *led_path;

rc = asprintf(&led_path, "/sys/class/leds/%s/%s", name, ctrl_file);
if (rc == -1) {
	fprintf(stderr, "Memory allocation failure for LED path");
	return rc;
}
/* Remember to free() led_path! */

> +
> +    FILE *fp = fopen(led_path,"w");
> +    if(fp == NULL)
> +    {
> +        fprintf(stderr,"Error opening:[%s]\n",led_path);
> +        perror("Error:");

So I did a quick man 3 printf and it doesn't actually say that it will clobber
errno (it also doesn't say it won't). I really don't think it is safe to make
the assumption that fprintf() won't change errno, what could well happen here is
fp == NULL, fprintf() encounters an error and perror() therefore prints the
perror of the failed fprintf() call and not the failed fopen call.

You should either backup errno across the call of fprintf, use strerror(errno)
in your fprintf() line or (if using glibc) use %m in your format string to
fprintf()

> +        return rc;
> +    }
> +
> +    if(fwrite(value, strlen(value), 1, fp) != 1)

is there a reason you're using fwrite() over fprintf()?

> +    {
> +        fprintf(stderr, "Error writing to :[%s]\n",led_path);
> +        perror("Error:");
> +    }
> +
> +    fclose(fp);
> +    return rc < 0 ? EXIT_FAILURE : EXIT_SUCCESS;

I didn't see a place where you changed rc from its initial value of -1, this
function will always return EXIT_FAILURE no?


> +}
> +
> +//----------------------------------------------------------------
> +// Router function for any LED operations that come via dbus
> +//----------------------------------------------------------------
> +static int led_function_router(sd_bus_message *msg, void *user_data,
> +                               sd_bus_error *ret_error)
> +{
> +    // Generic error reporter.
> +    int rc = -1;
> +
> +    // Extract the led name from the full dbus path
> +    char *led_path = sd_bus_message_get_path(msg);
> +    char *led_name = get_led_name(led_path);
> +    if(led_name == NULL)
> +    {
> +        fprintf(stderr, "Invalid LED name for path :[%s]\n",led_path);
> +        sd_bus_reply_method_return(msg, "i", rc);
> +    }

Please try to adhere to
https://github.com/openbmc/docs/blob/master/contributing.md#coding-style
for style, for example your { should be on the same line as if (led_name ==
NULL), and there should be a space where I added it

> +
> +    // Now that we have the LED name, get the Operation.
> +    const char *led_function = sd_bus_message_get_member(msg);
> +    if(led_function == NULL)
> +    {
> +        fprintf(stderr, "Null LED function specificed for : [%s]\n",led_name);
> +        sd_bus_reply_method_return(msg, "i", rc);
> +    }
> +
> +    // Route the user action to appropriate handlers.
> +    if( (strcmp(led_function, "TurnOn") == 0) ||
> +        (strcmp(led_function, "TurnOff") == 0))
> +    {
> +        rc = led_stable_state_function(led_name, led_function);
> +        sd_bus_reply_method_return(msg, "i", rc);
> +    }
> +    else if( (strcmp(led_function, "BlinkFast") == 0) ||
> +             (strcmp(led_function, "BlinkSlow") == 0))
> +    {
> +        rc = led_default_blink(led_name, led_function);
> +        sd_bus_reply_method_return(msg, "i", rc);
> +    }
> +    else if(strcmp(led_function, "BlinkCustom") == 0)
> +    {
> +        rc = led_custom_blink(led_name, msg);
> +        sd_bus_reply_method_return(msg, "i", rc);
> +    }
> +    else if(strcmp(led_function, "GetCurrentBrightness") == 0)
> +    {
> +        char value_str[10] = {0};
> +        char *led_state = NULL;
> +
> +        rc = read_led(led_name, power_ctrl, value_str);
> +        if(rc >= 0)
> +        {
> +            led_state = strtoul(value_str, NULL, 0) ? "Off" : "On";
> +        }
> +        sd_bus_reply_method_return(msg, "is", rc, led_state);
> +    }
> +    else
> +    {
> +        fprintf(stderr,"Invalid LED function:[%s]\n",led_function);
> +    }
> +
> +    sd_bus_reply_method_return(msg, "i", rc);

I don't think sd_bus_reply_method_return() does what you think. Have you
compiled this? Did GCC not tell you that you're missing a return statement?

> +}
> +
> +//--------------------------------------------------------------
> +// Turn On or Turn Off the LED
> +//--------------------------------------------------------------

Please also read the style guide for how to format comments.

> +int led_stable_state_function(char *led_name, char *led_function)
> +{
> +    // Generic error reporter.
> +    int rc = -1;
> +
> +    const char *value = NULL;
> +    if(strcmp(led_function, "TurnOn") == 0)
> +    {
> +        // LED active low
> +        value = "0";
> +    }
> +    else if(strcmp(led_function, "TurnOff") == 0)
> +    {
> +        value  = "255";
> +    }
> +    else
> +    {
> +        fprintf(stderr,"Invalid LED solid state operation:[%s] \n",led_function);
> +        return rc;
> +    }
> +
> +    // Before doing anything, need to turn off the blinking
> +    // if there is one in progress by writing 'none' to trigger
> +    rc = write_to_led(led_name, blink_ctrl, "none");
> +    if(rc < 0)
> +    {
> +        fprintf(stderr,"Error disabling blink. Function:[%s]\n", led_function);
> +        return rc;
> +    }
> +
> +    // Open the brightness file and write corresponding values.
> +    rc = write_to_led(led_name, power_ctrl, value);
> +    if(rc < 0)
> +    {
> +        fprintf(stderr,"Error driving LED. Function:[%s]\n", led_function);
> +    }
> +
> +    return rc;
> +}
> +
> +//-----------------------------------------------------------------------------------
> +// Given the on and off duration, applies the action on the specified LED.
> +//-----------------------------------------------------------------------------------
> +int blink_led(const char *led_name, const char *on_duration, const char *off_duration)
> +{
> +    // Generic error reporter
> +    int rc = -1;
> +
> +    // Protocol demands that 'timer' be echoed to 'trigger'
> +    rc = write_to_led(led_name, blink_ctrl, "timer");
> +    if(rc < 0)
> +    {
> +        fprintf(stderr,"Error writing timer to Led:[%s]\n", led_name);
> +        return rc;
> +    }
> +
> +    // After writing 'timer to 'trigger', 2 new files get generated namely
> +    // 'delay_on' and 'delay_off' which are telling the time duration for a
> +    // particular LED on and off.
> +    rc = write_to_led(led_name, duty_on, on_duration);
> +    if(rc < 0)
> +    {
> +        fprintf(stderr,"Error writing [%s] to delay_on:[%s]\n",on_duration,led_name);
> +        return rc;
> +    }
> +
> +    rc = write_to_led(led_name, duty_off, off_duration);
> +    if(rc < 0)
> +    {
> +        fprintf(stderr,"Error writing [%s] to delay_off:[%s]\n",off_duration,led_name);
> +    }
> +
> +    return rc;
> +}
> +
> +//----------------------------------------------------
> +// Default blink action on the LED.
> +//----------------------------------------------------
> +int led_default_blink(char *led_name, char *blink_type)
> +{
> +    // Generic error reporter
> +    int rc = -1;
> +
> +    // How long the LED needs to be in on and off state while blinking
> +    const char *on_duration = NULL;
> +    const char *off_duration = NULL;
> +    if(strcmp(blink_type, "BlinkSlow") == 0)
> +    {
> +        // Delay 700 millisec before 'on' and delay 200 millisec before off
> +        on_duration = "700";
> +        off_duration = "200";
> +    }
> +    else if(strcmp(blink_type, "BlinkFast") == 0)
> +    {
> +        // Delay 200 millisec before 'on' and delay 200 millisec before off
> +        on_duration = "200";
> +        off_duration = "200";
> +    }
> +    else
> +    {
> +        fprintf(stderr,"Invalid blink operation:[%s]\n",blink_type);
> +        return rc;
> +    }
> +
> +    rc = blink_led(led_name, on_duration, off_duration);
> +
> +    return rc;
> +}
> +
> +//-------------------------------------------------
> +// Blinks at user defined 'on' and 'off' intervals.
> +//-------------------------------------------------
> +int led_custom_blink(const char *led_name, sd_bus_message *msg)
> +{
> +    // Generic error reporter.
> +    int rc = -1;
> +
> +    // User supplied 'on' and 'off' duration
> +    const char *on_duration = NULL;
> +    const char *off_duration = NULL;
> +
> +    // Extract values into 'ss' ( string, string)
> +    rc = sd_bus_message_read(msg, "ss", &on_duration, &off_duration);
> +    if(rc < 0)
> +    {
> +        fprintf(stderr, "Failed to read 'on' and 'off' duration.[%s]\n", strerror(-rc));
> +    }
> +    else
> +    {

Hmmmm, I don't know if you want to do it here or in blink_led() but I feel like
you should do some validation of what you read from dbus, as these are strings
couldn't a sender send "foo" and "bar" for on_duration and off_duration, what
happens if they do?

> +        rc = blink_led(led_name, on_duration, off_duration);
> +    }
> +
> +    return rc;
> +}
> +
> +//---------------------------------------------------------------
> +// Gets the current value of passed in LED file
> +// Mainly used for reading 'brightness'
> +// NOTE : It is the responsibility of the caller to allocate
> +// sufficient space for buffer

How can the caller know how much space to allocate? The caller should probably
also tell read_led() how much space it has allocated

> +//----------------------------------------------------------------
> +int read_led(const char *name, const char *ctrl_file, void *value)
> +{
> +    // Generic error reporter.
> +    int rc = -1;
> +    int count = 0;
> +
> +    if(value == NULL)
> +    {
> +        fprintf(stderr, "Invalid buffer passed to LED read\n");
> +        return rc;
> +    }
> +
> +    // To get /sys/class/leds/<name>/<control file>
> +    char led_path[128] = {0};
> +
> +    strcpy(led_path, "/sys/class/leds/");
> +    strcat(led_path, name);
> +    strcat(led_path, "/");
> +    strcat(led_path, ctrl_file);
> +

Previous comments...

> +    FILE *fp = fopen(led_path,"rb");
> +    if(fp == NULL)
> +    {
> +        fprintf(stderr,"Error opening:[%s]\n",led_path);
> +        perror("Error:");
> +        return rc;
> +    }
> +
> +    char *sysfs_value = (char *)value;
> +    while((feof(fp)) == 0)

while(!feof(fp)) probably looks nicer...

> +    {
> +        sysfs_value[count++] = fgetc(fp);
> +    }
> +    sysfs_value[count]='\0';

What if the caller did not allocate enough space? What exactly is sysfs_value
buying you here?

> +
> +    fclose(fp);
> +    return EXIT_SUCCESS;
> +}
> +
> +//-----------------------------------------------
> +// Dbus Services offered by this LED controller
> +//-----------------------------------------------
> +static const sd_bus_vtable led_control_vtable[] =
> +{
> +    SD_BUS_VTABLE_START(0),
> +    SD_BUS_METHOD("TurnOn", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
> +    SD_BUS_METHOD("TurnOff", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
> +    SD_BUS_METHOD("BlinkFast", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
> +    SD_BUS_METHOD("BlinkSlow", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
> +    SD_BUS_METHOD("BlinkCustom", "ss", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
> +    SD_BUS_METHOD("GetCurrentBrightness", "", "is", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
> +    SD_BUS_VTABLE_END,
> +};
> +
> +//---------------------------------------------
> +// Interested in all files except standard ones
> +//---------------------------------------------
> +int led_select(const struct dirent *entry)
> +{
> +    if( (strcmp(entry->d_name, ".") == 0) ||
> +        (strcmp(entry->d_name, "..") == 0))
> +    {
> +        return 0;
> +    }
> +    return 1;
> +}
> +
> +//------------------------------------------------
> +// Called as part of setting up skeleton services.
> +// -----------------------------------------------
> +int start_led_services()
> +{
> +    // Generic error reporter.
> +    int rc = -1;
> +    int num_leds = 0;
> +
> +    // Bus and slot where we are offering the LED dbus service.
> +    sd_bus *bus_type = NULL;
> +    sd_bus_slot *led_slot = NULL;
> +
> +    // For walking '/sys/class/leds/' looking for names of LED.
> +    struct dirent **led_list;
> +
> +    // Get a hook onto system bus.
> +    rc = sd_bus_open_system(&bus_type);
> +    if(rc < 0)
> +    {
> +        fprintf(stderr,"Error opening system bus.\n");
> +        return rc;
> +    }
> +
> +    num_leds = scandir("/sys/class/leds/", &led_list, led_select, alphasort);
> +    if(num_leds <= 0)
> +    {
> +        fprintf(stderr,"No LEDs present in the system\n");
> +
> +        sd_bus_slot_unref(led_slot);
> +        sd_bus_unref(bus_type);
> +        return rc;
> +    }
> +
> +    // For each led present, announce the service on dbus.
> +    while(num_leds--)
> +    {
> +        char led_object[128] = {0};
> +        sprintf(led_object, "%s%s","/org/openbmc/controller/led/", led_list[num_leds]->d_name);

The constant portion should just be... well... in the format string, also use
snprintf to make sure you don't overflow led_object.

> +
> +        /* Install the object */
> +        rc = sd_bus_add_object_vtable(bus_type,
> +                                      &led_slot,
> +                                      led_object,                     /* object path */
> +                                      "org.openbmc.controller.led",   /* interface name */
> +                                      led_control_vtable,
> +                                      NULL);
> +        if (rc < 0)
> +        {
> +            fprintf(stderr, "Failed to add object to dbus: %s\n", strerror(-rc));
> +
> +            // Wipe the memory allocated for this particular entry.
> +            free(led_list[num_leds]);

Do you're only going to free this on error?

> +            break;
> +        }

sd_bus_add_object_vtable() does strdup led_object (or path as it refers to it)
for its own internal bookkeeping, you should be freeing all elements of led_list
regardless of error...

> +    }
> +
> +    // Done with all registration.
> +    free(led_list);
> +
> +    // If we had success in adding the providers, request for a bus name.
> +    if(rc == 0)
> +    {
> +        /* Take one in OpenBmc */
> +        rc = sd_bus_request_name(bus_type, "org.openbmc.controller.led", 0);
> +        if (rc < 0)
> +        {
> +            fprintf(stderr, "Failed to acquire service name: %s\n", strerror(-rc));
> +        }
> +        else
> +        {
> +            for (;;)
> +            {
> +                /* Process requests */
> +                rc = sd_bus_process(bus_type, NULL);
> +                if (rc < 0)
> +                {
> +                    fprintf(stderr, "Failed to process bus: %s\n", strerror(-rc));
> +                    break;
> +                }
> +                if (rc > 0)
> +                {
> +                    continue;
> +                }
> +
> +                rc = sd_bus_wait(bus_type, (uint64_t) - 1);
> +                if (rc < 0)
> +                {
> +                    fprintf(stderr, "Failed to wait on bus: %s\n", strerror(-rc));
> +                    break;
> +                }
> +            }
> +        }
> +    }
> +    sd_bus_slot_unref(led_slot);
> +    sd_bus_unref(bus_type);
> +
> +    return rc < 0 ? EXIT_FAILURE : EXIT_SUCCESS;

Ummmm two things, the only caller of start_led_services ignores the return
value and I don't see how we're going to get that return to return
EXIT_SUCCESS...

> +}
> +
> +int main(void)
> +{
> +    start_led_services();
> +    return 0;
> +}
