Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x243.google.com (mail-pa0-x243.google.com
 [IPv6:2607:f8b0:400e:c03::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C40861A01D8
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 14:23:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=vcLqM7+e; 
 dkim-atps=neutral
Received: by mail-pa0-x243.google.com with SMTP id pv5so7966562pac.0
 for <openbmc@lists.ozlabs.org>; Mon, 01 Feb 2016 19:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding;
 bh=IijBMvzizT+Q+Z24/Jqv7VSDmE4X1DLkHTbw/xiPgcg=;
 b=vcLqM7+eeDYfsuNVfZEsrnuitQlisP5gQ3RdA7XVMczzGDSG6P6hL0jcvHTVLePfcj
 1DgzjcmIsLXkppsz4H02MM5T3bWRj5qsOqrXx3KyKda4XfQp61VOSR26UY0uUkqwV4jr
 eDJKUYrA8Gfd1bWD6lgK3QJIEANyYdFGoMI3kIxWmAH6g55VX32AA3o4Kk5R93Rwhf3W
 fe5adBWnjIRhO96YPdAvrDzggMtFMqYhMuCj0MKvX3K0VgZMGBWW4joQ93A/bPC15Hvb
 H9YVsMIzykYoX5nl5xrI5ibcibsvNC1toAP/IuOkJ0zkMjfajTmeoQ2lr69oFtlgmbv7
 hYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-type:content-transfer-encoding;
 bh=IijBMvzizT+Q+Z24/Jqv7VSDmE4X1DLkHTbw/xiPgcg=;
 b=C9U1XsUhI3k1xemIkT9J9x3PtfH7F5yy0iPI20Bc1QYmIQtr9aVDgGGIcWaTAQwp73
 VET7OXGcV0z9zBGr5Mf/pz6ZQbUESgDyDIwWYJjZreqxxjrMJ+nvaGeI6jual0b1cLYw
 C4UGRYz9Lwbmn9AwCCDG4Z7oHtLzImoAtG5ExDTJ8jhtUO6LxtlgAMeyCwrcWO9pE3e9
 wG/fUMgQeEl1a1MihvO9XfVwYyg7CwWLc14qJeuhHmkItRyywYUhXWW4OfJK0Nx+A/UP
 OcKkE7bcyPfKydzGuR72jlS1GCu+6vb34kFMumU0VrLK84UPmNMy98DLviijBixRgvgf
 UNeQ==
X-Gm-Message-State: AG10YORTD/N87eSrgxJ/2tNDY2jBcfL5AKWxFmbcsqVllAKsUDhQg0kLw2jcW/DHboU0dg==
X-Received: by 10.66.55.73 with SMTP id q9mr44119468pap.44.1454383407108;
 Mon, 01 Feb 2016 19:23:27 -0800 (PST)
Received: from camb691 ([138.44.251.171])
 by smtp.gmail.com with ESMTPSA id q20sm20532651pfa.70.2016.02.01.19.23.25
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 01 Feb 2016 19:23:26 -0800 (PST)
Date: Tue, 2 Feb 2016 14:23:21 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH skeleton v3] Refactored LED control dbus methods
Message-ID: <20160202142321.7f0a8344@camb691>
In-Reply-To: <1454088639-9831-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454088639-9831-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454088639-9831-2-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 02 Feb 2016 03:23:30 -0000

On Fri, 29 Jan 2016 11:30:39 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: vishwa <vishwanath@in.ibm.com>
> 

Hi Vishwa,

I the patch looks better! Still a few comments...

I'm not sure I've been noticing, but is your indenting space based? For C it
should be tab based...

> ---
>  Makefile                     |   5 +-
>  objects/led_controller_new.c | 488 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 492 insertions(+), 1 deletion(-)
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
> index 0000000..c8b3f92
> --- /dev/null
> +++ b/objects/led_controller_new.c
> @@ -0,0 +1,488 @@
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <errno.h>
> +#include <string.h>
> +#include <dirent.h>
> +#include <systemd/sd-bus.h>
> +
> +/*
> + * These are control files that are present for each led under
> + *'/sys/class/leds/<led_name>/' which are used to trigger action
> + * on the respective leds by writing predefined data.
> + */
> +const char *power_ctrl = "brightness";
> +const char *blink_ctrl = "trigger";
> +const char *duty_on    = "delay_on";
> +const char *duty_off   = "delay_off";
> +
> +/*
> + * --------------------------------------------------
> + * Given the dbus path, returns the name of the LED
> + * --------------------------------------------------
> + */
> +char *get_led_name(const char *dbus_path)
> +{
> +    char *led_name = NULL;
> +
> +    /* Get the led name from /org/openbmc/control/led/<name> */
> +    led_name = strrchr(dbus_path, '/');
> +    if(led_name)
> +    {

Sorry, maybe I forgot to say in the previous patch, the '{' for control flow
(if, while, for...) statements should be on the same line.

So the above should look like 'if (led_name) {' also note the space after 'if'


> +        led_name++;
> +    }
> +
> +    return led_name;
> +}
> +
> +/*
> + * -------------------------------------------------------------------------
> + * Writes the 'on / off / blink' trigger to leds.
> + * -------------------------------------------------------------------------
> + */
> +int write_to_led(const char *name, const char *ctrl_file, const char *value)
> +{
> +    /* Generic error reporter. */
> +    int rc = -1;
> +
> +    /* To get /sys/class/leds/<name>/<control file> */
> +    char led_path[128] = {0};
> +
> +    int len = 0;
> +    len = snprintf(led_path, sizeof(led_path), 
> +                   "/sys/class/leds/%s/%s",name, ctrl_file);
> +    if(len >= sizeof(led_path))
> +    {
> +        fprintf(stderr, "Error. LED path is too long. :[%d]\n",len);
> +        return rc;
> +    }
> +
> +    FILE *fp = fopen(led_path,"w");
> +    if(fp == NULL)
> +    {
> +        perror("Error:");
> +        fprintf(stderr,"Error opening:[%s]\n",led_path);

So you're going to have two "Error" messages... is that not possibly
misleading? Furthermore (from the perror man page):

	First (if s is not NULL and *s is not a null byte ('\0')), the argument
	string s is printed, followed by a colon and a blank.

So your perror will print "Error:: " followed by the errno string...


> +        return rc;
> +    }
> +
> +    rc = fwrite(value, strlen(value), 1, fp);

Feel free to answer my questions...

> +    if(rc != 1)
> +    {
> +        perror("Error:");
> +        fprintf(stderr, "Error writing to :[%s]\n",led_path);
> +    }
> +
> +    fclose(fp);
> +
> +    /* When we get here, rc would be what it was from writing to the file */
> +    return (rc == 1) ? 0 : -1;
> +}
> +
> +/*
> + * ----------------------------------------------------------------
> + * Router function for any LED operations that come via dbus
> + *----------------------------------------------------------------
> + */
> +static int led_function_router(sd_bus_message *msg, void *user_data,
> +                               sd_bus_error *ret_error)
> +{
> +    /* Generic error reporter. */
> +    int rc = -1;
> +
> +    /* Extract the led name from the full dbus path */
> +    const char *led_path = sd_bus_message_get_path(msg);
> +    if(led_path == NULL)
> +    {
> +        fprintf(stderr, "Error. LED path is empty");
> +        return sd_bus_reply_method_return(msg, "i", rc);
> +    }
> +
> +    char *led_name = get_led_name(led_path);
> +    if(led_name == NULL)
> +    {
> +        fprintf(stderr, "Invalid LED name for path :[%s]\n",led_path);
> +        return sd_bus_reply_method_return(msg, "i", rc);
> +    }
> +
> +    /* Now that we have the LED name, get the Operation. */
> +    const char *led_function = sd_bus_message_get_member(msg);
> +    if(led_function == NULL)
> +    {
> +        fprintf(stderr, "Null LED function specificed for : [%s]\n",led_name);
> +        return sd_bus_reply_method_return(msg, "i", rc);
> +    }
> +
> +    /* Route the user action to appropriate handlers. */
> +    if( (strcmp(led_function, "setOn") == 0) ||
> +        (strcmp(led_function, "setOff") == 0))
> +    {
> +        rc = led_stable_state_function(led_name, led_function);
> +        return sd_bus_reply_method_return(msg, "i", rc);
> +    }
> +    else if( (strcmp(led_function, "setBlinkFast") == 0) ||
> +             (strcmp(led_function, "setBlinkSlow") == 0))
> +    {
> +        rc = led_default_blink(led_name, led_function);
> +        return sd_bus_reply_method_return(msg, "i", rc);
> +    }
> +    else if(strcmp(led_function, "GetLedState") == 0)
> +    {
> +        char value_str[10] = {0};
> +        const char *led_state = NULL;
> +
> +        rc = read_led(led_name, power_ctrl, value_str, sizeof(value_str));
> +        if(rc >= 0)
> +        {
> +            /* LED is active low */
> +            led_state = strtoul(value_str, NULL, 0) ? "Off" : "On";
> +        }
> +        return sd_bus_reply_method_return(msg, "is", rc, led_state);
> +    }
> +    else
> +    {
> +        fprintf(stderr,"Invalid LED function:[%s]\n",led_function);
> +    }
> +
> +    return sd_bus_reply_method_return(msg, "i", rc);
> +}
> +
> +/*
> + * --------------------------------------------------------------
> + * Turn On or Turn Off the LED
> + * --------------------------------------------------------------
> + */
> +int led_stable_state_function(char *led_name, char *led_function)
> +{
> +    /* Generic error reporter. */
> +    int rc = -1;
> +
> +    const char *value = NULL;
> +    if(strcmp(led_function, "setOn") == 0)
> +    {
> +        /* LED active low */
> +        value = "0";
> +    }
> +    else if(strcmp(led_function, "setOff") == 0)
> +    {
> +        value  = "255";
> +    }
> +    else
> +    {
> +        fprintf(stderr,"Invalid LED stable state operation:[%s] \n",led_function);
> +        return rc;
> +    }
> +
> +    /*
> +     * Before doing anything, need to turn off the blinking
> +     * if there is one in progress by writing 'none' to trigger
> +     */
> +    rc = write_to_led(led_name, blink_ctrl, "none");
> +    if(rc < 0)
> +    {
> +        fprintf(stderr,"Error disabling blink. Function:[%s]\n", led_function);
> +        return rc;
> +    }
> +
> +    /*
> +     * Open the brightness file and write corresponding values.
> +     */
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
> +    /* Generic error reporter */
> +    int rc = -1;
> +
> +    /* Protocol demands that 'timer' be echoed to 'trigger' */
> +    rc = write_to_led(led_name, blink_ctrl, "timer");
> +    if(rc < 0)
> +    {
> +        fprintf(stderr,"Error writing timer to Led:[%s]\n", led_name);
> +        return rc;
> +    }
> +
> +    /*
> +     * After writing 'timer to 'trigger', 2 new files get generated namely
> +     *'delay_on' and 'delay_off' which are telling the time duration for a
> +     * particular LED on and off.
> +     */
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
> +/*
> + * ----------------------------------------------------
> + * Default blink action on the LED.
> + * ----------------------------------------------------
> + */
> +int led_default_blink(char *led_name, char *blink_type)
> +{
> +    /* Generic error reporter */
> +    int rc = -1;
> +
> +    /* How long the LED needs to be in on and off state while blinking */
> +    const char *on_duration = NULL;
> +    const char *off_duration = NULL;
> +    if(strcmp(blink_type, "setBlinkSlow") == 0)
> +    {
> +        //*Delay 900 millisec before 'on' and delay 900 millisec before off */
> +        on_duration = "900";
> +        off_duration = "900";
> +    }
> +    else if(strcmp(blink_type, "setBlinkFast") == 0)
> +    {
> +        /* Delay 200 millisec before 'on' and delay 200 millisec before off */
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
> +/*
> + * ---------------------------------------------------------------
> + * Gets the current value of passed in LED file
> + * Mainly used for reading 'brightness'
> + * NOTE : It is the responsibility of the caller to allocate
> + * sufficient space for buffer. This will read upto user supplied 
> + * size -or- entire contents of file whichever is smaller
> + * ----------------------------------------------------------------
> + */
> +int read_led(const char *name, const char *ctrl_file, 
> +             void *value, const size_t len)
> +{
> +    /* Generic error reporter. */
> +    int rc = -1;
> +    int count = 0;
> +
> +    if(value == NULL || len <= 0)
> +    {
> +        fprintf(stderr, "Invalid buffer passed to LED read\n");
> +        return rc;
> +    }
> +
> +    /* To get /sys/class/leds/<name>/<control file> */
> +    char led_path[128] = {0};
> +
> +    int led_len = 0;
> +    led_len = snprintf(led_path, sizeof(led_path), 
> +                   "/sys/class/leds/%s/%s",name, ctrl_file);
> +    if(led_len >= sizeof(led_path))
> +    {
> +        fprintf(stderr, "Error. LED path is too long. :[%d]\n",led_len);
> +        return rc;
> +    }
> +
> +    FILE *fp = fopen(led_path,"rb");
> +    if(fp == NULL)
> +    {
> +        perror("Error:");
> +        fprintf(stderr,"Error opening:[%s]\n",led_path);
> +        return rc;
> +    }
> +
> +    char *sysfs_value = (char *)value;
> +    while(!feof(fp) && (count < len))
> +    {
> +        sysfs_value[count++] = fgetc(fp);
> +    }
> +    sysfs_value[count]='\0';

Hmmmm, are you sure you don't have a fencepost error here?

Say len == 5, and that your file has 10 chars in it. Your loop will correctly
write info sysfs_value[0],[1],[2],[3],[4]. Then count == len so your condition
breaks the loop and you will write the '\0' into sysfs_value[5]... but that is
the sixth char...

> +
> +    fclose(fp);
> +    return 0;
> +}
> +
> +/*
> + * -----------------------------------------------
> + * Dbus Services offered by this LED controller
> + * -----------------------------------------------
> + */
> +static const sd_bus_vtable led_control_vtable[] =
> +{
> +    SD_BUS_VTABLE_START(0),
> +    SD_BUS_METHOD("setOn", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
> +    SD_BUS_METHOD("setOff", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
> +    SD_BUS_METHOD("setBlinkFast", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
> +    SD_BUS_METHOD("setBlinkSlow", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
> +    SD_BUS_METHOD("GetLedState", "", "is", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
> +    SD_BUS_VTABLE_END,
> +};
> +
> +/*
> + * ---------------------------------------------
> + * Interested in all files except standard ones
> + * ---------------------------------------------
> + */
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
> +/*
> + * ------------------------------------------------
> + * Called as part of setting up skeleton services.
> + * -----------------------------------------------
> + */
> +int start_led_services()
> +{
> +    /* Generic error reporter. */
> +    int rc = -1;
> +    int num_leds = 0;
> +    int count_leds = 0;
> +
> +    /* Bus and slot where we are offering the LED dbus service. */
> +    sd_bus *bus_type = NULL;
> +    sd_bus_slot *led_slot = NULL;
> +
> +    /* For walking '/sys/class/leds/' looking for names of LED.*/
> +    struct dirent **led_list;
> +
> +    /* Get a hook onto system bus. */
> +    rc = sd_bus_open_system(&bus_type);
> +    if(rc < 0)
> +    {
> +        fprintf(stderr,"Error opening system bus.\n");
> +        return rc;
> +    }
> +
> +    count_leds = num_leds = scandir("/sys/class/leds/", 
> +                                    &led_list, led_select, alphasort);
> +    if(num_leds <= 0)
> +    {
> +        fprintf(stderr,"No LEDs present in the system\n");
> +
> +        sd_bus_slot_unref(led_slot);
> +        sd_bus_unref(bus_type);
> +        return rc;
> +    }
> +
> +    /* Fully qualified Dbus object for a particular LED */
> +    char led_object[128] = {0};
> +    int len = 0;
> +
> +    /* For each led present, announce the service on dbus. */
> +    while(num_leds--)
> +    { Merge
> +        memset(led_object, 0x0, sizeof(led_object));
> +
> +        len = snprintf(led_object, sizeof(led_object), "%s%s",
> +                "/org/openbmc/controller/led/", led_list[num_leds]->d_name);
> +
> +        if(len >= sizeof(led_object))
> +        {
> +            fprintf(stderr, "Error. LED object is too long:[%d]\n",len);
> +            rc = -1;
> +            break;
> +        }
> +
> +        /* Install the object */
> +        rc = sd_bus_add_object_vtable(bus_type,
> +                                      &led_slot,
> +                                      led_object,                     /* object path */
> +                                      "org.openbmc.controller.led",   /* interface name */
> +                                      led_control_vtable,
> +                                      NULL);
> +
> +        if (rc < 0)
> +        {
> +            fprintf(stderr, "Failed to add object to dbus: %s\n", strerror(-rc));
> +            break;
> +        }
> +    }
> +
> +    /* Done with all registration. */
> +    while (count_leds > 0)
> +    {
> +        free(led_list[--count_leds]);
> +        if(count_leds == 0)
> +        {
> +            free(led_list);
> +        }
> +    }

Well looks like it works, so that's an improvement over the leaky previous
patch... I'm not sure why you had to have a second loop... or have this overly
complicated one...

for (i = 0; i < count_leds; i++)
	free(led_list[i]);
free(led_list);

looks quite a bit simpler to me... or really could integrate it into the look
above...

> +
> +    /* If we had success in adding the providers, request for a bus name. */
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
> +    return rc;
> +}
> +
> +int main(void)
> +{
> +    int rc = 0;
> +
> +    /* This call is not supposed to return. If it does, then an error */
> +    rc = start_led_services();
> +    if(rc < 0)
> +    {
> +        fprintf(stderr, "Error starting LED Services. Exiting");
> +    }
> +
> +    return rc;
> +}
