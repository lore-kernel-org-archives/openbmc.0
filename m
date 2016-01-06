Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x22f.google.com (mail-pf0-x22f.google.com
 [IPv6:2607:f8b0:400e:c00::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5D8561A118D
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2016 16:09:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=sdAZ7O5d; 
 dkim-atps=neutral
Received: by mail-pf0-x22f.google.com with SMTP id q63so196400462pfb.0
 for <openbmc@lists.ozlabs.org>; Tue, 05 Jan 2016 21:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding;
 bh=S5cUlqgOcnQdmSka8jj6mIbXy+XlaIdrJIQ7zgFd1N8=;
 b=sdAZ7O5dkwsQJW6Opj6xeAT5nylz5roCxL4a1vrBGrcOzZpN+cbywbXgHOGVcai0Hk
 Z7aqd0QP6tJmwtwZ3DDXD53C7urqgDD/ia0kOMxsiKr79LpO6GQx2YPzm0beOegANEFw
 2SESfLJrHAUOaeYty7BoJQBfrSE/hLLhlCvle+51DNNhGYwUZdZc4Hukutu3UKURn0bc
 8ZFbrFpc8dvap0NH675ufPZ6gPx5oIgCsTNGsrN5NEEXxaccXGU5DuM8FWwqSC6vNsvf
 T7F4S5K+4tZLF/bEfFmhOPZfO0U6V0d7DzQmWDRI0dL7WKrdcqQDt7QiP74xSV2GToDs
 wBmw==
X-Received: by 10.98.80.15 with SMTP id e15mr61796642pfb.20.1452056984028;
 Tue, 05 Jan 2016 21:09:44 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id by2sm82983996pab.6.2016.01.05.21.09.41
 (version=TLSv1/SSLv3 cipher=OTHER);
 Tue, 05 Jan 2016 21:09:43 -0800 (PST)
Date: Wed, 6 Jan 2016 16:09:34 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, shgoupf <shgoupf@cn.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid v4] Add get/set boot option ipmid
 command support with correct DBUS property handling.
Message-ID: <20160106160934.493e446f@camb691>
In-Reply-To: <1451956226-19954-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1451956226-19954-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1451956226-19954-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.1 (GTK+ 2.24.29; x86_64-unknown-linux-gnu)
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
X-List-Received-Date: Wed, 06 Jan 2016 05:09:47 -0000

On Mon,  4 Jan 2016 19:10:26 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: shgoupf <shgoupf@cn.ibm.com>
> 

Hi again,

> 1) Add support for IPMI get/set boot option command.
>     a) boot options stored in dbus property.
>     b) IPMI get boot option command get boot option from the dbus
>     property.
>     c) IPMI set boot option coomand set boot option to the dbus
>     property.
> 2) Two methods to handle the dbus property set and get:
>     a) dbus_set_property()
>     b) dbus_get_property()
> 3) The property is stored as a 10 character strings which representsd 5-byte information.
> 4) ipmid set method is registered and implemented since petitboot will use it to clear the boot options.
> 5) Get service name via object mapper
>     a) The connection name is got via objectmapper.
>     b) The method used to get the connection name is object_mapper_get_connection().
>     c) dbus_get_property/dbus_set_property will get the connection name via the above method instead of hard coding.
> 6) Error code are properly handled.
> 7) Use sprinf/sscanf for int/string conversion.
>     a) Instead of reinventing the wheel by defining methods converting int to string, use sprintf/sscanf should be a more clean and robust way.

Plus 1 for not reinventing the wheel but perhaps consider using the best tool
for the job, sscanf can and does do what you want however atoi, atol, atoll,
strtol, strtoll, strtoq functions are all designed for this exact purpose. They
will perform much better than sscanf, also the str* versions give great control
and error detection capabilities.


> 8) Fix issues addressed by the community.
>     a) change malloc heap to stack local variable.
>     b) Fix multi line comment style from "//" to "/**/".
>     c) Add defines for return codes.
>     d) Add more comments.

It looks like you're adding more and more into this same patch. A single patch
should be one clearly defined piece of work. So you're implementing some new
functionality, that should be its own patch. You're also adding some error
handling paths - also, its own patch. You've changed some whitespace (some of
which was a bad thing) but the good whitespace changes should also be their own
patch.

>  chassishandler.C | 492 +++++++++++++++++++++++++++++++++++++++++++++----------
>  chassishandler.h |  18 ++
>  2 files changed, 423 insertions(+), 87 deletions(-)
> 
> diff --git a/chassishandler.C b/chassishandler.C
> index 1389db9..4d941e8 100644
> --- a/chassishandler.C
> +++ b/chassishandler.C
> @@ -5,11 +5,235 @@
>  #include <stdint.h>
>  
>  // OpenBMC Chassis Manager dbus framework
> -const char  *chassis_bus_name      =  "org.openbmc.control.Chassis";
> -const char  *chassis_object_name   =  "/org/openbmc/control/chassis0";
> -const char  *chassis_intf_name     =  "org.openbmc.control.Chassis";
> +const char * chassis_bus_name      =  "org.openbmc.control.Chassis";
> +const char * chassis_object_name   =  "/org/openbmc/control/chassis0";
> +const char * chassis_intf_name     =  "org.openbmc.control.Chassis";
>  

Not necessary, if anything you should remove the double space but what you've
done doesn't look good.

> -void register_netfn_chassis_functions() __attribute__((constructor));
> +// Host settings in dbus
> +// Service name should be referenced by connection name got via object mapper
> +const char * settings_object_name  =  "/org/openbmc/settings/host0";
> +const char * settings_intf_name    =  "org.freedesktop.DBus.Properties";
> +
> +const char * objmapper_service_name =  "org.openbmc.objectmapper";
> +const char * objmapper_object_name  =  "/org/openbmc/objectmapper/objectmapper";
> +const char * objmapper_intf_name    =  "org.openbmc.objectmapper.ObjectMapper";
> +

We probably want to try to keep a consistent style. I looked at ipmid.C and
that file isn't consistent but it seems to be mostly "type *name;" and that's
the most common way everywhere else with C code.

> +int object_mapper_get_connection (char ** buf, const char * obj_path)
> +{
> +    sd_bus_error error = SD_BUS_ERROR_NULL;
> +    sd_bus_message * m = NULL;
> +    sd_bus * bus = NULL;
> +    char * temp_buf = NULL, *intf = NULL;
> +    size_t buf_size = 0;
> +    int r;
> +
> +    // Open the system bus where most system services are provided.
> +    r = sd_bus_open_system (&bus);
> +

As an added stylistic note, again for consistency, ipmid.C, you should avoid
having a space between the function name and the parameters 

> +    if (r < 0) {
> +        fprintf (stderr, "Failed to connect to system bus: %s\n", strerror (-r));
> +        goto finish;
> +    }
> +
> +    /*
> +     * Bus, service, object path, interface and method are provided to call
> +     * the method.
> +     * Signatures and input arguments are provided by the arguments at the
> +     * end.
> +     */
> +    r = sd_bus_call_method (bus,
> +                            objmapper_service_name,                      /* service to contact */
> +                            objmapper_object_name,                       /* object path */
> +                            objmapper_intf_name,                         /* interface name */
> +                            "GetObject",                                 /* method name */
> +                            &error,                                      /* object to return error in */
> +                            &m,                                          /* return message on success */
> +                            "s",                                         /* input signature */
> +                            obj_path                                     /* first argument */
> +                           );
> +
> +    if (r < 0) {
> +        fprintf (stderr, "Failed to issue method call: %s\n", error.message);
> +        goto finish;
> +    }
> +
> +    // Get the key, aka, the connection name
> +    sd_bus_message_read (m, "a{sas}", 1, &temp_buf, 1, &intf);
> +

This seems very roundabout, could you explain this method call. What are you
expecting to receive? From the looks of what you're using it for wouldn't it
make more sense to just sd_bus_message_read a "s"?

> +    /*
> +     * TODO: check the return code. Currently for no reason the message
> +     * parsing of object mapper is always complaining about
> +     * "Device or resource busy", but the result seems OK for now. Need
> +     * further checks.

If sd_bus_message_read returns a negative value, something definitely went
wrong, I highly highly doubt you can use the result if it turns a negative.

> +     * TODO: The following code is preserved in the comments so that it can be
> +     * resumed after the problem aforementioned is resolved.
> +     *r = sd_bus_message_read(m, "a{sas}", 1, &temp_buf, 1, &intf);
> +     *if (r < 0) {
> +     *    fprintf(stderr, "Failed to parse response message: %s\n", strerror(-r));
> +     *    goto finish;
> +     *}

The code is in git, it is saved there, delete it now and when someone wants to
add it back they can look in the git history for what was deleted. Having said
that, the error check should be there, if you're hitting it, you should figure
out why.

> +     */
> +
> +    buf_size = strlen (temp_buf) + 1;
> +    printf ("IPMID connection name: %s\n", temp_buf);
> +    *buf = (char *)malloc (buf_size);
> +
> +    if (*buf == NULL) {
> +        fprintf (stderr, "Malloc failed for get_sys_boot_options");
> +        r = -1;
> +        goto finish;
> +    }
> +

I don't mind using malloc but these are strings no? Couldn't strndup be used,
might make life easier? Not a big concern.

> +    memcpy (*buf, temp_buf, buf_size);
> +
> +finish:
> +    sd_bus_error_free (&error);
> +    sd_bus_message_unref (m);
> +    sd_bus_unref (bus);
> +

Spaces between name and params

> +    return r;
> +}
> +
> +int dbus_get_property (char * buf)
> +{
> +    sd_bus_error error = SD_BUS_ERROR_NULL;
> +    sd_bus_message * m = NULL;
> +    sd_bus * bus = NULL;
> +    char * temp_buf = NULL;
> +    uint8_t * get_value = NULL;
> +    char * connection = NULL;
> +    int r, i;
> +
> +    r = object_mapper_get_connection (&connection, settings_object_name);
> +
> +    if (r < 0) {
> +        fprintf (stderr, "Failed to get connection, return value: %d.\n", r);
> +        goto finish;
> +    }
> +
> +    printf ("connection: %s\n", connection);
> +
> +    // Open the system bus where most system services are provided.
> +    r = sd_bus_open_system (&bus);
> +
> +    if (r < 0) {
> +        fprintf (stderr, "Failed to connect to system bus: %s\n", strerror (-r));
> +        goto finish;
> +    }
> +
> +    /*
> +     * Bus, service, object path, interface and method are provided to call
> +     * the method.
> +     * Signatures and input arguments are provided by the arguments at the
> +     * end.
> +     */
> +    r = sd_bus_call_method (bus,
> +                            connection,                                 /* service to contact */
> +                            settings_object_name,                       /* object path */
> +                            settings_intf_name,                         /* interface name */
> +                            "Get",                                      /* method name */
> +                            &error,                                     /* object to return error in */
> +                            &m,                                         /* return message on success */
> +                            "ss",                                       /* input signature */
> +                            settings_intf_name,                         /* first argument */
> +                            "boot_flags");                              /* second argument */
> +
> +    if (r < 0) {
> +        fprintf (stderr, "Failed to issue method call: %s\n", error.message);
> +        goto finish;
> +    }
> +
> +    /*
> +     * The output should be parsed exactly the same as the output formatting
> +     * specified.
> +     */
> +    r = sd_bus_message_read (m, "v", "s", &temp_buf);
> +

Why not just read a "s"?

> +    if (r < 0) {
> +        fprintf (stderr, "Failed to parse response message: %s\n", strerror (-r));
> +        goto finish;
> +    }
> +
> +    printf ("IPMID boot option property get: {%s}.\n", (char *) temp_buf);
> +
> +    /*
> +     * To represent a hex in string, e.g., "A0A0", which represents two bytes
> +     * in the hex, but requires 5 bytes to store it as string, i.e., 4
> +     * characters to store the "A0A0" and 1 additional space for "\0".
> +     * Thereby we have 2 * <number of bytes> + 1 for the string buffer.
> +     */

So why don't you have #define NUM_RETURN_BYTES_OF_GET_USED 11 ? 

This question is out of scope of this patch but why are we passing around
numbers as strings? dbus handles other types...

> +    memcpy (buf, temp_buf, 2 * NUM_RETURN_BYTES_OF_GET_USED + 1);
> +
> +finish:
> +    sd_bus_error_free (&error);
> +    sd_bus_message_unref (m);
> +    sd_bus_unref (bus);
> +    free (connection);
> +
> +    return r;
> +}
> +
> +int dbus_set_property (const char * buf)
> +{
> +    sd_bus_error error = SD_BUS_ERROR_NULL;
> +    sd_bus_message * m = NULL;
> +    sd_bus * bus = NULL;
> +    char * connection = NULL;
> +    int r;
> +
> +    r = object_mapper_get_connection (&connection, settings_object_name);
> +
> +    if (r < 0) {
> +        fprintf (stderr, "Failed to get connection, return value: %d.\n", r);
> +        goto finish;
> +    }
> +
> +    printf ("connection: %s\n", connection);
> +
> +    // Open the system bus where most system services are provided.
> +    r = sd_bus_open_system (&bus);
> +
> +    if (r < 0) {
> +        fprintf (stderr, "Failed to connect to system bus: %s\n", strerror (-r));
> +        goto finish;
> +    }
> +
> +    /*
> +     * Bus, service, object path, interface and method are provided to call
> +     * the method.
> +     * Signatures and input arguments are provided by the arguments at the
> +     * end.
> +     */
> +    r = sd_bus_call_method (bus,
> +                            connection,                                 /* service to contact */
> +                            settings_object_name,                       /* object path */
> +                            settings_intf_name,                         /* interface name */
> +                            "Set",                                      /* method name */
> +                            &error,                                     /* object to return error in */
> +                            &m,                                         /* return message on success */
> +                            "ssv",                                      /* input signature */
> +                            settings_intf_name,                         /* first argument */
> +                            "boot_flags",                               /* second argument */
> +                            "s",                                        /* third argument */
> +                            buf);                                       /* fourth argument */
> +

Are we documenting these interfaces at all, I don't understand why "ssv" and
then a hardcoded "s", why not "sss"?

> +    if (r < 0) {
> +        fprintf (stderr, "Failed to issue method call: %s\n", error.message);
> +        goto finish;
> +    }
> +
> +    printf ("IPMID boot option property set: {%s}.\n", buf);
> +
> +finish:
> +    sd_bus_error_free (&error);
> +    sd_bus_message_unref (m);
> +    sd_bus_unref (bus);
> +    free (connection);
> +
> +    return r;
> +}
> +
> +void register_netfn_chassis_functions () __attribute__ ((constructor));
>  
>  struct get_sys_boot_options_t {
>      uint8_t parameter;
> @@ -17,11 +241,28 @@ struct get_sys_boot_options_t {
>      uint8_t block;
>  }  __attribute__ ((packed));
>  
> -ipmi_ret_t ipmi_chassis_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
> -                              ipmi_request_t request, ipmi_response_t response, 
> -                              ipmi_data_len_t data_len, ipmi_context_t context)
> +struct set_sys_boot_options_t {
> +    uint8_t parameter;
> +    union {
> +        struct {
> +            uint8_t d1;
> +            uint8_t d2;
> +            uint8_t d3;
> +            uint8_t d4;
> +            uint8_t d5;
> +            uint8_t d6;
> +            uint8_t d7;
> +            uint8_t d8;
> +        } data8;
> +        uint64_t data64;
> +    } data;
> +}  __attribute__ ((packed));
> +
> +ipmi_ret_t ipmi_chassis_wildcard (ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> +                                  ipmi_request_t request, ipmi_response_t response,
> +                                  ipmi_data_len_t data_len, ipmi_context_t context)
>  {
> -    printf("Handling CHASSIS WILDCARD Netfn:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
> +    printf ("Handling CHASSIS WILDCARD Netfn:[0x%X], Cmd:[0x%X]\n", netfn, cmd);

Be careful with changes like this, you didn't change this code...

>      // Status code.
>      ipmi_ret_t rc = IPMI_CC_OK;
>      *data_len = 0;
> @@ -31,116 +272,193 @@ ipmi_ret_t ipmi_chassis_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>  //------------------------------------------------------------
>  // Calls into Chassis Control Dbus object to do the power off
>  //------------------------------------------------------------
> -int ipmi_chassis_power_control(const char *method)
> +int ipmi_chassis_power_control (const char * method)
>  {
> -	// sd_bus error
> -	int rc = 0;
> +    // sd_bus error
> +    int rc = 0;
>  
>      // SD Bus error report mechanism.
>      sd_bus_error bus_error = SD_BUS_ERROR_NULL;
>  
> -	// Response from the call. Although there is no response for this call,
> -	// obligated to mention this to make compiler happy.
> -	sd_bus_message *response = NULL;
> -
> -	// Gets a hook onto either a SYSTEM or SESSION bus
> -	sd_bus *bus_type = ipmid_get_sd_bus_connection();
> -
> -	rc = sd_bus_call_method(bus_type,        		 // On the System Bus
> -							chassis_bus_name,        // Service to contact
> -							chassis_object_name,     // Object path 
> -							chassis_intf_name,       // Interface name
> -							method,      		 // Method to be called
> -							&bus_error,      		 // object to return error
> -							&response,		 		 // Response buffer if any
> -							NULL);			 		 // No input arguments
> -	if(rc < 0)
> -	{
> -		fprintf(stderr,"ERROR initiating Power Off:[%s]\n",bus_error.message);
> -	}
> -	else
> -	{
> -		printf("Chassis Power Off initiated successfully\n");
> -	}
> -
> -    sd_bus_error_free(&bus_error);
> -    sd_bus_message_unref(response);
> -
> -	return rc;
> +    /*
> +     * Response from the call. Although there is no response for this call,
> +     * obligated to mention this to make compiler happy.
> +     */
> +    sd_bus_message * response = NULL;
> +
> +    // Gets a hook onto either a SYSTEM or SESSION bus
> +    sd_bus * bus_type = ipmid_get_sd_bus_connection ();
> +
> +    rc = sd_bus_call_method (bus_type,                /* On the System Bus*/
> +                             chassis_bus_name,        /* Service to contact*/
> +                             chassis_object_name,     /* Object path*/
> +                             chassis_intf_name,       /* Interface name*/
> +                             method,                  /* Method to be called*/
> +                             &bus_error,              /* object to return error*/
> +                             &response,               /* Response buffer if any*/
> +                             NULL);                   /* No input arguments*/
> +
> +    if (rc < 0) {
> +        fprintf (stderr, "ERROR initiating Power Off:[%s]\n", bus_error.message);
> +    } else {
> +        printf ("Chassis Power Off initiated successfully\n");
> +    }
> +
> +    sd_bus_error_free (&bus_error);
> +    sd_bus_message_unref (response);
> +
> +    return rc;

Cleanups are great but please send them as a separate patch, this helps people
a lot when reviewing patches, if it is just a cleanup then people can focus on
checking that you didn't change behaviour OR if you're sending a functional
change patch people can focus on checking that you're achieving what you set
out to do.

>  }
>  
>  
>  //----------------------------------------------------------------------
>  // Chassis Control commands
>  //----------------------------------------------------------------------
> -ipmi_ret_t ipmi_chassis_control(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
> -                        ipmi_request_t request, ipmi_response_t response, 
> -                        ipmi_data_len_t data_len, ipmi_context_t context)
> +ipmi_ret_t ipmi_chassis_control (ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> +                                 ipmi_request_t request, ipmi_response_t response,
> +                                 ipmi_data_len_t data_len, ipmi_context_t context)
>  {
> -	// Error from power off.
> -	int rc = 0;
> +    // Error from power off.
> +    int rc = 0;
>  
> -	// No response for this command.
> +    // No response for this command.
>      *data_len = 0;
>  
> -	// Catch the actual operaton by peeking into request buffer
> -	uint8_t chassis_ctrl_cmd = *(uint8_t *)request;
> -	printf("Chassis Control Command: Operation:[0x%X]\n",chassis_ctrl_cmd);
> -
> -	switch(chassis_ctrl_cmd)
> -	{
> -		case CMD_POWER_OFF:
> -			rc = ipmi_chassis_power_control("powerOff");
> -			break;
> -		case CMD_HARD_RESET:
> -			rc = ipmi_chassis_power_control("reboot");
> -			break;
> -		default:
> -		{
> -			fprintf(stderr, "Invalid Chassis Control command:[0x%X] received\n",chassis_ctrl_cmd);
> -			rc = -1;
> -		}
> -	}
> -
> -	return ( (rc < 0) ? IPMI_CC_INVALID : IPMI_CC_OK);
> +    // Catch the actual operaton by peeking into request buffer
> +    uint8_t chassis_ctrl_cmd = * (uint8_t *)request;
> +    printf ("Chassis Control Command: Operation:[0x%X]\n", chassis_ctrl_cmd);
> +
> +    switch (chassis_ctrl_cmd) {
> +    case CMD_POWER_OFF:
> +        rc = ipmi_chassis_power_control ("powerOff");
> +        break;
> +
> +    case CMD_HARD_RESET:
> +        rc = ipmi_chassis_power_control ("reboot");
> +        break;
> +
> +    default: {
> +        fprintf (stderr, "Invalid Chassis Control command:[0x%X] received\n", chassis_ctrl_cmd);
> +        rc = -1;
> +    }
> +    }
> +
> +    return ((rc < 0) ? IPMI_CC_INVALID : IPMI_CC_OK);
>  }
>  
> -ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
> -                              ipmi_request_t request, ipmi_response_t response, 
> -                              ipmi_data_len_t data_len, ipmi_context_t context)
> +ipmi_ret_t ipmi_chassis_get_sys_boot_options (ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> +        ipmi_request_t request, ipmi_response_t response,
> +        ipmi_data_len_t data_len, ipmi_context_t context)
>  {
>      ipmi_ret_t rc = IPMI_CC_OK;
>      *data_len = 0;
>  
> -    printf("IPMI GET_SYS_BOOT_OPTIONS\n");
> +    printf ("IPMI GET_SYS_BOOT_OPTIONS\n");
> +
> +    get_sys_boot_options_t * reqptr = (get_sys_boot_options_t *) request;
> +
> +    /*
> +     * To represent a hex in string, e.g., "A0A0", which represents two bytes
> +     * in the hex, but requires 5 bytes to store it as string, i.e., 4
> +     * characters to store the "A0A0" and 1 additional space for "\0".
> +     * Thereby we have 2 * <number of bytes> + 1 for the string buffer.
> +     */
> +    char buf[NUM_RETURN_BYTES_OF_GET * 2 + 1] = {0};

Once again, why not #define NUM_RETURN_BYTES_OF_GET 11

>  
> -    get_sys_boot_options_t *reqptr = (get_sys_boot_options_t*) request;
> +    /*
> +     * Parameter #5 means boot flags. Please refer to 28.13 of ipmi doc.
> +     * This is the only parameter used by petitboot.
> +     */
> +    if (reqptr->parameter == 5) {
> +        int r = dbus_get_property (buf);
>  
> -    // TODO Return default values to OPAL until dbus interface is available
> +        if (r < 0) {
> +            fprintf (stderr, "Dbus get property failed for get_sys_boot_options.\n");
> +            return IPMI_OUT_OF_SPACE;
> +        }
>  
> -    if (reqptr->parameter == 5) // Parameter #5
> -    {
> -        uint8_t buf[] = {0x1,0x5,80,0,0,0,0};
> -        *data_len = sizeof(buf);
> -        memcpy(response, &buf, *data_len);
> +        uint64_t return_value;
> +        sscanf (buf, "%llX", &return_value);

See my comment at the top about the best tool for the job.

> +
> +        *data_len = NUM_RETURN_BYTES_OF_GET;
> +        /*
> +         * TODO: last 3 bytes
> +         *(NUM_RETURN_BYTES_OF_GET - NUM_RETURN_BYTES_OF_GET_USED) is meanlingless
> +         */
> +        memcpy (response, (uint8_t *) (&return_value), *data_len);

So this interests me, does whoever is going to be reading response know to read
it as a uint64_t on success but as an array of chars on failure, also, rather
than #defineing, wouldn't:

*data_len = sizeof(return_value);

be better?


I've done some looking around in ipmid.C and I don't think what you've done
will work,
https://github.com/openbmc/phosphor-host-ipmid/blob/master/ipmid.C#L276
appears to use the first byte of response as the completion code but you've
just written whatever the first byte of your uint64_t is into response[0]...

Also, 28.13 in the IPMI spec doesn't seem to match up with whats going on here,
am I missing something?

> +    } else {
> +        *data_len = NUM_RETURN_BYTES_OF_GET;
> +        // Parameter not supported
> +        buf[0] = IPMI_CC_PARM_NOT_SUPPORTED;
> +        memcpy (response, buf, *data_len);
> +        fprintf (stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
> +        return IPMI_CC_PARM_NOT_SUPPORTED;
>      }
> -    else
> -    {
> -        fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
> -        return IPMI_CC_PARM_NOT_SUPPORTED;        
> +
> +    return rc;
> +}
> +
> +ipmi_ret_t ipmi_chassis_set_sys_boot_options (ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> +        ipmi_request_t request, ipmi_response_t response,
> +        ipmi_data_len_t data_len, ipmi_context_t context)
> +{
> +    ipmi_ret_t rc = IPMI_CC_OK;
> +
> +    printf ("IPMI SET_SYS_BOOT_OPTIONS\n");
> +    printf ("IPMID set command required return bytes: %i\n", *data_len);
> +
> +    set_sys_boot_options_t * reqptr = (set_sys_boot_options_t *) request;
> +
> +    char output_buf[NUM_RETURN_BYTES_OF_SET] = {0};
> +
> +    /*
> +     * Parameter #5 means boot flags. Please refer to 28.13 of ipmi doc.
> +     * This is the only parameter used by petitboot.
> +     */
> +    if (reqptr->parameter == 5) { 
> +        /*
> +         * To represent a hex in string, e.g., "A0A0", which represents two bytes
> +         * in the hex, but requires 5 bytes to store it as string, i.e., 4
> +         * characters to store the "A0A0" and 1 additional space for "\0".
> +         * Thereby we have 2 * <number of bytes> + 1 for the string buffer.
> +         */
> +        char input_buf[NUM_INPUT_BYTES_OF_SET * 2 + 1];
> +        sprintf (input_buf, "%llX", reqptr->data.data64);
> +
> +        int r = dbus_set_property (input_buf);
> +
> +        if (r < 0) {
> +            fprintf (stderr, "Dbus set property failed for set_sys_boot_options.\n");
> +            return IPMI_OUT_OF_SPACE;
> +        }
> +
> +        *data_len = NUM_RETURN_BYTES_OF_SET;
> +        // Return code OK.
> +        output_buf[0] = IPMI_OK;
> +        memcpy (response, output_buf, *data_len);
> +    } else {
> +        // Parameter not supported
> +        output_buf[0] = IPMI_CC_PARM_NOT_SUPPORTED;
> +        memcpy (response, output_buf, *data_len);
> +        fprintf (stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
> +        return IPMI_CC_PARM_NOT_SUPPORTED;

As far as I can see you're simply using output_buf to assign the first byte of
response to either IPMI_OK or IPMI_CC_PARM_NOT_SUPPORTED and you're using
memcpy.

Wouldn't it be nicer to 
memset(response, 0, *data_len);
(or not even memset since NUM_RETURN_BYTES_OF_SET is 1) and
*response = IPMI_OK; 
or
*response = IPMI_CC_PARM_NOT_SUPPORTED;
and avoid having output_buf at all?

Which makes me wonder why response is actually a void *, is this a good idea?

>      }
>  
>      return rc;
>  }
>  
> -void register_netfn_chassis_functions()
> +void register_netfn_chassis_functions ()
>  {
> -    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_WILDCARD);
> -    ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_WILDCARD, NULL, ipmi_chassis_wildcard);
> +    printf ("Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN_CHASSIS, IPMI_CMD_WILDCARD);
> +    ipmi_register_callback (NETFUN_CHASSIS, IPMI_CMD_WILDCARD, NULL, ipmi_chassis_wildcard);
>  
> -    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_GET_SYS_BOOT_OPTIONS);
> -    ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_GET_SYS_BOOT_OPTIONS, NULL, ipmi_chassis_get_sys_boot_options);
> +    printf ("Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN_CHASSIS, IPMI_CMD_GET_SYS_BOOT_OPTIONS);
> +    ipmi_register_callback (NETFUN_CHASSIS, IPMI_CMD_GET_SYS_BOOT_OPTIONS, NULL, ipmi_chassis_get_sys_boot_options);
>  
> -    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL);
> -    ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL, NULL, ipmi_chassis_control);
> +    printf ("Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN_CHASSIS, IPMI_CMD_SET_SYS_BOOT_OPTIONS);
> +    ipmi_register_callback (NETFUN_CHASSIS, IPMI_CMD_SET_SYS_BOOT_OPTIONS, NULL, ipmi_chassis_set_sys_boot_options);
> +
> +    printf ("Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL);
> +    ipmi_register_callback (NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL, NULL, ipmi_chassis_control);
>  }
> +
> diff --git a/chassishandler.h b/chassishandler.h
> index 1a26411..a310741 100644
> --- a/chassishandler.h
> +++ b/chassishandler.h
> @@ -3,21 +3,39 @@
>  
>  #include <stdint.h>
>  
> +// TODO: Petitboot requires 8 bytes of response
> +// however only 5 of them are used. The remaining
> +// 3 bytes are not used in petitboot and the value
> +// of them are all zero.
> +#define NUM_RETURN_BYTES_OF_GET 8
> +#define NUM_RETURN_BYTES_OF_GET_USED 5
> +#define NUM_RETURN_BYTES_OF_SET 1
> +#define NUM_INPUT_BYTES_OF_SET 5
> +
>  // IPMI commands for Chassis net functions.
>  enum ipmi_netfn_app_cmds
>  {
>  	// Chassis Control
>  	IPMI_CMD_CHASSIS_CONTROL	  = 0x02,
>      // Get capability bits
> +    IPMI_CMD_SET_SYS_BOOT_OPTIONS = 0x08,
>      IPMI_CMD_GET_SYS_BOOT_OPTIONS = 0x09,
>  };
>  
>  // Command specific completion codes
>  enum ipmi_chassis_return_codes
>  {
> +    IPMI_OK = 0x0,
>      IPMI_CC_PARM_NOT_SUPPORTED = 0x80,
>  };
>  
> +// Generic completion codes,
> +// see IPMI doc section 5.2
> +enum ipmi_generic_return_codes
> +{
> +    IPMI_OUT_OF_SPACE = 0xC4,
> +};
> +
>  // Various Chassis operations under a single command.
>  enum ipmi_chassis_control_cmds : uint8_t
>  {
