Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x244.google.com (mail-pa0-x244.google.com
 [IPv6:2607:f8b0:400e:c03::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7B2121A0196
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 12:21:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=nkT5EY2p; 
 dkim-atps=neutral
Received: by mail-pa0-x244.google.com with SMTP id ho8so674951pac.3
 for <openbmc@lists.ozlabs.org>; Mon, 01 Feb 2016 17:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding;
 bh=zboyiU+cTogI8DMQEvvEVniqWEjdbHLHc0NTSjtm6GI=;
 b=nkT5EY2pRH56lkWjtZDkQtpOtsmv6CWNYYV2SXys9+ElmaClsDmbav1BxvmNi3snoK
 Q3ax6Atels9+GQwyNdxR8zWd/XJfckCpvWD29Xg1/I9kjNwISNmFOn+nY8BuPZ9XscM6
 cNnpIO5UesAY4Qwvd7QUNu5yf2qfPjaya5xFAemlkDdu+iOv6nhR5jkFjegOx1hSPLiE
 c0WqW4V364d6hnhPu6frbEhXMn/BQdiMgODglhrNWGIOwWxTU5/gN9YKBtfTOup2Udcr
 wzMinMvyV+88dbpoprmbaodBwaja4nFZmeCCu/BsyXqb4alHaQDzn08ywRM2ZwC3hB9W
 EKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-type:content-transfer-encoding;
 bh=zboyiU+cTogI8DMQEvvEVniqWEjdbHLHc0NTSjtm6GI=;
 b=ZkJjEMxiR1Ou1ePDibrJuUfU6E13faUxB1J7tMNApqpqbI5NCvWhkNGfdE82GNtWl8
 IYxgXPyryuRnNSyYGTmuVLr6qTE9uaa2qMSGZSzjsPRdQNkmkjhCoNmTlJcBxU/cR6Ho
 1+ZONKj72UxWL2YpdOOuu4fXTKSSNI5FpYqm6Y4k85YGyxX4NQpcPmSPqaDJbzqDsY9s
 0nH30/1SR1Hb63D00KlnudwcbQyOhz0Y3bJBb/vOi8re+SjKY3UGRtjAGpIqCy6a+BLH
 DvfGTOSeOfLLEUvfNxEq/j16cHFRfIZ3m+wRDI9uDZhshNWXTzT/Gk7zW/sVxEFQu6rc
 NOWA==
X-Gm-Message-State: AG10YORA9dPYtLvxAx8pP3OetLBO8sXs4I8peYipMGr0a+N88LkPPj7Q4Y4x8k6cqx5o/g==
X-Received: by 10.66.121.194 with SMTP id lm2mr43128639pab.27.1454376106167;
 Mon, 01 Feb 2016 17:21:46 -0800 (PST)
Received: from camb691 ([138.44.251.171])
 by smtp.gmail.com with ESMTPSA id m5sm6686874pfi.84.2016.02.01.17.21.44
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 01 Feb 2016 17:21:45 -0800 (PST)
Date: Tue, 2 Feb 2016 12:21:40 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-settingsd] Move settings to c code
Message-ID: <20160202122140.7adb7d35@camb691>
In-Reply-To: <1454107831-18878-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454107831-18878-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454107831-18878-2-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 02 Feb 2016 01:21:49 -0000

On Fri, 29 Jan 2016 16:50:31 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Chris Austen <austenc@us.ibm.com>
> 
> This gets the boot_list and PowerCap settings exposed
> on the dbus.
> 

Hi Chris,

I'm indebted to your forever, this kind of thing fills my heart with joy:
   settings_manager.py |  87 ----------------------
   settings_parser.py  |  20 -----

Overall great patch, I have a few comments.

So, I know I've been a bit painful with stylistic comments, but I have the
best interests of the project at heart :).

Is your C code space indented (it looks like it but I can't be sure with my
client atm)? We've established that we'll follow PEP8 for Python code but for C
we're following kernel style which is tabbed indenting.

Also, kernel C style avoids CamelCase. You've used both underscores and
CamelCase... please stick to the underscores.

> Examples of how to now interact...
> $ curl -c cjar -b cjar -k https://x.x.x.x/org/openbmc/settings/host0
> {
>   "data": {
>     "boot_mode_list": [
>       "Default",
>       "Network",
>       "Disk",
>       "Safe",
>       "CDROM",
>       "Setup"
>     ],
>     "current_boot_mode": "Default",
>     "power_cap_default": 999,
>     "power_cap_max": 1000,
>     "power_cap_min": 1,
>     "power_cap_now": 998
>   },
>   "message": "200 OK",
>   "status": "ok"
> }
> View a single property
> curl -c cjar -b cjar -k https://192.168.7.2/org/openbmc/settings/host0/attr/Current_boot_mode
> Make the Network the current boot device
> curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST -d "{\"data\": [\"CDROM\"]}" https://x.x.x.x/org/openbmc/settings/host0/action/setBootMode
> Set the powercap to 42
> curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST -d "{\"data\": [42]}" https://x.x.x.x/org/openbmc/settings/host0/action/setPowerCap
> ---
>  Makefile            |  22 ++++++
>  settings_file.py    |   2 -
>  settings_manager.c  | 206 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  settings_manager.py |  87 ----------------------
>  settings_parser.py  |  20 -----
>  5 files changed, 228 insertions(+), 109 deletions(-)
>  create mode 100644 Makefile
>  delete mode 100644 settings_file.py
>  create mode 100644 settings_manager.c
>  delete mode 100755 settings_manager.py
>  delete mode 100755 settings_parser.py
> 
> diff --git a/Makefile b/Makefile
> new file mode 100644
> index 0000000..5d00300
> --- /dev/null
> +++ b/Makefile
> @@ -0,0 +1,22 @@
> +
> +EXE     = settings_manager
> +
> +OBJS    = $(EXE).o   \

Unneeded trailing \

> +
> +
> +DEPPKGS = libsystemd
> +CC      ?= $(CROSS_COMPILE)gcc
> +INCLUDES += $(shell pkg-config --cflags $(DEPPKGS)) 
> +LIBS += $(shell pkg-config --libs $(DEPPKGS))
> +CFLAGS += -Wall
> +
> +all: $(EXE)
> +
> +%.o : %.c 
> +	$(CC) -c $< $(CFLAGS) $(INCLUDES) -o $@
> +
> +$(EXE): $(OBJS)
> +	$(CC) $^ $(LDFLAGS) $(LIBS) -o $@
> +
> +clean:
> +	rm -f $(OBJS) $(EXE) *.o 
> diff --git a/settings_file.py b/settings_file.py
> deleted file mode 100644
> index e05bc31..0000000
> --- a/settings_file.py
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -#!/usr/bin/python -u
> -SETTINGS={'host': {'bootflags': {'default': '0000000000', 'type': 's', 'name': 'boot_flags'}, 'powercap': {'name': 'power_cap', 'min': 0, 'default': 0, 'max': 1000, 'type': 'i', 'unit': 'watts'}, 'sysstate': {'default': '', 'type': 's', 'name': 'system_state'}}}
> \ No newline at end of file
> diff --git a/settings_manager.c b/settings_manager.c
> new file mode 100644
> index 0000000..7125cb8
> --- /dev/null
> +++ b/settings_manager.c
> @@ -0,0 +1,206 @@
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <errno.h>
> +#include <stddef.h>
> +#include <systemd/sd-bus.h>
> +
> +const char *gService = "org.openbmc.settings.Host";
> +const char *gObjPath = "/org/openbmc/settings/host0";
> +const char *gIntPath = "org.openbmc.Settings";

Whats wit the g infront of your variable names?

> +
> +
> +typedef struct _settings_t {
> +    char*   currentBootMode;

It isn't super clear to me how you're using it but looks like (at least for
now) you might mean const char* current_boot_mode;

> +    int32_t powercap;
> +    int32_t powercap_min;
> +    int32_t powercap_max;
> +    int32_t powercap_default;
> +} settings_t;

Unless there's a good reason for making the struct opaque throughout the
project it would be best not to typedef it, the rationale here is that
throughout the code it makes it difficult for the programmer to remember what a
'settings_t' really is where as when the type is 'struct settings' it's more
clear. This avoids silly mistakes.

> +
> +#define MAX_BOOT_MODES 6
> +char gPossibleBootModes[MAX_BOOT_MODES][10] = {
> +    "Default",
> +    "Network",
> +    "Disk",
> +    "Safe",
> +    "CDROM",
> +    "Setup"
> +};
> +
> +static int method_boot_mode_list(sd_bus *bus,
> +                          const char *path,
> +                          const char *interface,
> +                          const char *property,
> +                          sd_bus_message *reply,
> +                          void *userdata,
> +                          sd_bus_error *error) {
> +
> +    int r, i=0;

Initialising i is unnecessary.

> +
> +    printf("Building boot mode list\n");
> +
> +    r = sd_bus_message_open_container(reply, 'a', "s");
> +    if (r < 0)
> +        return r;
> +
> +    for (i=0;i<MAX_BOOT_MODES;i++) {

Please add spaces here.

> +        r = sd_bus_message_append(reply, "s", gPossibleBootModes[i]);
> +        if (r < 0) {
> +            fprintf(stderr, "Failed to build the list of failed boot modes: %s", strerror(-r));
> +            return r;
> +        }
> +    }
> +
> +    return sd_bus_message_close_container(reply);
> +}
> +
> +static int method_setBootMode(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
> +
> +    int i, r=-1;
> +    char *str;
> +    settings_t *settings = (settings_t *) userdata;
> +
> +    printf("Setting boot mode list\n");

I'm assuming this is going to be a longrunning daemon, should we reconsider
just using stdout and stderr? This might be a bigger discussion though and we
should all agree as to how we're doing logging...

> +
> +    r = sd_bus_message_read(m, "s", &str);
> +    if (r < 0) {
> +        fprintf(stderr, "Failed to extract string: %s", strerror(-r));
> +        goto final;
> +    } 
        ^ Trailing space

Should you do any kind of validation here? I've said it before that I think we
do trust all the components in the system but then again, a basic amount of
validation on that string might be nice, at least that it doesn't exceed your
string size of 10 in gPOssibleBootModes


> +
> +    for (i=0;i<MAX_BOOT_MODES;i++) {
> +        if(!strcmp(gPossibleBootModes[i], str)) {


strncmp? You've declared each element in gPossibleBootModes[] to be 10 chars
big... oh and a space after the 'if'

> +            settings->currentBootMode = &gPossibleBootModes[i][0];

Or just settings->currentBootMode = gPossibleBootModes[i];

So you found something here, which means r will retain whatever value
sd_bus_message_read() returned and you're going to return that in
sd_bus_reply_method_return(), this is what you want to do?

> +            break;
> +        }
> +    }
> +
> +    if (i == MAX_BOOT_MODES) {
> +        // Getting here means string of what 
> +        // they wanted did not map to anything
> +        r = -1;
> +    }
> +
> +    final:
> +    return sd_bus_reply_method_return(m, "i", r);
> +}
> +
> +
> +static int method_setPowerCap(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
> +
> +    int r;
> +    int32_t  pcap;
> +    settings_t *settings = (settings_t *) userdata;
> +
> +    printf("Setting Power Cap\n");
> +
> +    r = sd_bus_message_read(m, "i", &pcap);
> +    if (r < 0) {
> +        fprintf(stderr, "Failed to extract data: %s", strerror(-r));
> +    }  else {
> +
> +        if ((pcap <= settings->powercap_max) &&
> +            (pcap >= settings->powercap_min)) {
> +                settings->powercap = pcap;
> +        } else {
> +            return sd_bus_reply_method_error(m,&SD_BUS_ERROR_MAKE_CONST( \
> +                SD_BUS_ERROR_INVALID_ARGS,                               \
> +                "value not supported"));
> +        }
> +    }
> +

Again, returning whatever sd_bus_message_read() gave...

> +    return sd_bus_reply_method_return(m, "i", r);
> +}
> +
> +static const sd_bus_vtable vtable[] = {
> +    SD_BUS_VTABLE_START(0),
> +    SD_BUS_METHOD("setBootMode", "s", "i", method_setBootMode, SD_BUS_VTABLE_UNPRIVILEGED),
> +    SD_BUS_METHOD("setPowerCap", "i", "i", method_setPowerCap, SD_BUS_VTABLE_UNPRIVILEGED),
> +    SD_BUS_PROPERTY("current_boot_mode", "s", NULL, offsetof(settings_t, currentBootMode), SD_BUS_VTABLE_PROPERTY_CONST),
> +    SD_BUS_PROPERTY("boot_mode_list", "as", method_boot_mode_list, 0, SD_BUS_VTABLE_PROPERTY_CONST),
> +    SD_BUS_PROPERTY("power_cap_now",     "i", NULL, offsetof(settings_t, powercap), SD_BUS_VTABLE_PROPERTY_CONST),
> +    SD_BUS_PROPERTY("power_cap_min",     "i", NULL, offsetof(settings_t, powercap_min), SD_BUS_VTABLE_PROPERTY_CONST),
> +    SD_BUS_PROPERTY("power_cap_max",     "i", NULL, offsetof(settings_t, powercap_max), SD_BUS_VTABLE_PROPERTY_CONST),
> +    SD_BUS_PROPERTY("power_cap_default", "i", NULL, offsetof(settings_t, powercap_default), SD_BUS_VTABLE_PROPERTY_CONST),
> +    SD_BUS_VTABLE_END
> +};
> +
> +
> +void init_settings(settings_t *p) {
> +
> +    // Someday there will be a file that the defaults can come from
> +    // This stuff for now is completely fake and doesn't do anything.
> +    // Simply the place holder to make it easier for the pcap to be
> +    // set
> +    settings_t t = { 
> +        gPossibleBootModes[0],
> +        998, 1, 1000, 999
> +    };
> +
> +    memcpy(p,&t,sizeof(settings_t));
> +
> +    return;
> +}
> +
> +int start_HostSettingsService(void) {
> +
> +    sd_bus *bus;
> +    sd_bus_slot *slot;
> +    int r;
> +    settings_t settings;
> +
> +    init_settings(&settings);
> +
> +    r = sd_bus_open_system(&bus);
> +    if (r < 0) {
> +        fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r));
> +        goto finish;
> +    }
> +
> +    /* Install the object */
> +    r = sd_bus_add_object_vtable(bus,
> +                                 &slot,
> +                                 gObjPath,
> +                                 gIntPath,
> +                                 vtable,
> +                                 &settings);
> +    if (r < 0) {
> +        fprintf(stderr, "Failed to issue method call: %s\n", strerror(-r));
> +        goto finish;
> +    }
> +    
> +    /* Take a well-known service name so that clients can find us */
> +    r = sd_bus_request_name(bus, gService, 0);
> +    if (r < 0) {
> +        fprintf(stderr, "Failed to acquire service name: %s\n", strerror(-r));
> +        goto finish;
> +    }
> +
> +
> +    for (;;) {
> +        r = sd_bus_process(bus, NULL);
> +        if (r < 0) {
> +            fprintf(stderr, "Failed to process bus: %s\n", strerror(-r));
> +            goto finish;
> +        }
> +
> +        if (r > 0)
> +            continue;       
> +
> +        r = sd_bus_wait(bus, (uint64_t) -1);
> +        if (r < 0) {
> +            fprintf(stderr, "Failed to wait on bus: %s\n", strerror(-r));
> +            goto finish;
> +        }
> +    }
> +    finish:
> +        sd_bus_unref(bus);

The two lines above are indented too much.

> +
> +    return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;

Yeah so I don't see a scenario where r won't be < 0....

> +}
> +
> +
> +int main(int argc, char *argv[]) {
> +
> +    return start_HostSettingsService();
> +}
> \ No newline at end of file
> diff --git a/settings_manager.py b/settings_manager.py
> deleted file mode 100755
> index e49b466..0000000
> --- a/settings_manager.py
> +++ /dev/null
> @@ -1,87 +0,0 @@
> -#!/usr/bin/python -u
> -
> -import gobject
> -import dbus
> -import dbus.service
> -import dbus.mainloop.glib
> -import os
> -import os.path as path
> -import Openbmc
> -import settings_file as s
> -
> -DBUS_NAME = 'org.openbmc.settings.Host'
> -OBJ_NAME = '/org/openbmc/settings/host0'
> -CONTROL_INTF = 'org.openbmc.Settings'
> -
> -class HostSettingsObject(Openbmc.DbusProperties):
> -    def __init__(self, bus, name, settings, path):
> -        Openbmc.DbusProperties.__init__(self)
> -        dbus.service.Object.__init__(self, bus, name)
> -
> -        self.path = path
> -        if not os.path.exists(path):
> -            os.mkdir(path)
> -
> -        # Listen to changes in the property values and sync them to the BMC
> -        bus.add_signal_receiver(self.settings_signal_handler,
> -            dbus_interface = "org.freedesktop.DBus.Properties",
> -            signal_name = "PropertiesChanged",
> -            path = "/org/openbmc/settings/host0")
> -
> -        # Create the dbus properties
> -        for i in settings['host'].iterkeys():
> -            shk = settings['host'][i]
> -            self.set_settings_property(shk['name'],
> -                                       shk['type'],
> -                                       shk['default'])
> -
> -    def get_bmc_value(self, name):
> -        try:
> -            with open(path.join(self.path, name), 'r') as f:
> -                return f.read()
> -        except (IOError):
> -            pass
> -        return None
> -
> -    # Create dbus properties based on bmc value. This will be either a value
> -    # previously set, or the default file value if the BMC value does not exist.
> -    def set_settings_property(self, name, type, value):
> -        bmcv = self.get_bmc_value(name)
> -        if bmcv:
> -            value = bmcv
> -        if type=="i":
> -            self.Set(DBUS_NAME, name, value)
> -        elif type=="s":
> -            self.Set(DBUS_NAME, name, str(value))
> -
> -    # Save the settings to the BMC. This will write the settings value in
> -    # individual files named by the property name to the BMC.
> -    def set_system_settings(self, name, value):
> -        bmcv = self.get_bmc_value(name)
> -        if bmcv != value:
> -            filepath = path.join(self.path, name)
> -            with open(filepath, 'w') as f:
> -                f.write(str(value))
> -
> -    # Signal handler for when one ore more settings properties were updated.
> -    # This will sync the changes to the BMC.
> -    def settings_signal_handler(self, interface_name, changed_properties, invalidated_properties):
> -        for name, value in changed_properties.items():
> -            self.set_system_settings(name, value)
> -
> -    # Placeholder signal. Needed to register the settings interface.
> -    @dbus.service.signal(DBUS_NAME, signature='s')
> -    def SettingsUpdated(self, sname):
> -        pass
> -
> -if __name__ == '__main__':
> -    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
> -
> -    bus = Openbmc.getDBus()
> -    name = dbus.service.BusName(DBUS_NAME, bus)
> -    obj = HostSettingsObject(bus, OBJ_NAME, s.SETTINGS, "/var/lib/obmc/")
> -    mainloop = gobject.MainLoop()
> -
> -    print "Running HostSettingsService"
> -    mainloop.run()
> -
> diff --git a/settings_parser.py b/settings_parser.py
> deleted file mode 100755
> index 46bb474..0000000
> --- a/settings_parser.py
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -#!/usr/bin/python -u
> -
> -# Simple parser to create a python dictionary from a yaml file.
> -# It saves the applications from doing the parsing and
> -# adding dependencies to additional modules like yaml
> -
> -import yaml
> -
> -SETTINGS_FILE = 'settings.yaml'
> -OUTPUT_FILE = 'settings_file.py'
> -FILE_HEADER = '#!/usr/bin/python -u'
> -
> -with open(SETTINGS_FILE) as s:
> -    data = yaml.safe_load(s)
> -
> -with open(OUTPUT_FILE, 'w') as f:
> -    f.write(FILE_HEADER)
> -    f.write('\n')
> -    f.write('SETTINGS=')
> -    f.write(str(data))
