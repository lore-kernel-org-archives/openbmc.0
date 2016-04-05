Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qfBD410j5zDq5f
 for <openbmc@lists.ozlabs.org>; Tue,  5 Apr 2016 11:32:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=bWYGO6JF; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id q129so22602548pfb.3
 for <openbmc@lists.ozlabs.org>; Mon, 04 Apr 2016 18:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D2zXHtkn32H29EaH/V2ExtTKdJQ8iuVm6kR4t75eT8I=;
 b=bWYGO6JFG3Z/MUYiiYVgTP5t/0anlAsPPF4OyR+YE/wmQOAHiPbwyRsnHrpxOWOdo2
 fGnAyjqAtF/WuapaxWdVnlJwZzpul5HXFW7A2KkUWZ/gsaQIOPw8v06oV5Iv4smdsB+e
 Cx7BFzpj/9ZwIZ2axBIQAesUJ2SAWSjifG3EVQn8dqYnZiRVgAH8PA347DlBh1bjssR4
 zwB8znEfksDoFyAD/ZOZzTod9sJPfXt6v1PJpfBK0hsOa0fay/sualOLaERmCi/W2BRE
 tkqcOJ9ZVK5wxgoRZPWnD4Y/MathSyEGtfP0aR/VZ+hCmVD8zWTrxzz7zg5D9Ek6FKbm
 9e5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D2zXHtkn32H29EaH/V2ExtTKdJQ8iuVm6kR4t75eT8I=;
 b=KLID5dMwHsOExaIKMfp0lMk/bQiB3G92j+EZEUnq9Ipix74fWajrTD51N1nKW9wN/5
 sAviBFy2QkjAWUldOZmeEWhUiiViTHwBWzKZntPNE6ZfyKnicTXISu6iXoLaUp7NK9FC
 bglCyOXgqpb7U54ibI/uhj6BR9XZlrS1ZA+MG9DjJcGcvn+sCXcYVtf7PWwe13EHkce6
 C9GuTmysy1o7eWLU4gtYBMstUF4r9ruYYzmDSaIHL8GuYSpvYEGySrml2hytD5P7YUvV
 yRZqzWuahfeZfUcVPwyfi4zlQsrFgGKCFwO58gEiSI33GwZrv0nu07BBdNz1uhqOHu8J
 1hug==
X-Gm-Message-State: AD7BkJIsMsrGRJSZc83WmQrjcIgqIQcgQNfajEyk0IRxp1f5aaQ+cMpN1co5O67HnwsUHA==
X-Received: by 10.98.43.204 with SMTP id r195mr25313092pfr.49.1459819922051;
 Mon, 04 Apr 2016 18:32:02 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id f8sm42204911pfj.49.2016.04.04.18.32.00
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 04 Apr 2016 18:32:01 -0700 (PDT)
Date: Tue, 5 Apr 2016 11:31:50 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: ratagupt <ratagupt@in.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid] Adding Boot Policy
Message-ID: <20160405113150.70c2ffe5@camb691>
In-Reply-To: <1459769436-22641-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1459769436-22641-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1459769436-22641-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
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
X-List-Received-Date: Tue, 05 Apr 2016 01:32:04 -0000

On Mon,  4 Apr 2016 06:30:36 -0500
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

Hi,

Thanks for the contribution. I have some concerns, most are summarised here:
https://github.com/openbmc/docs/blob/master/contributing.md

You'll want to note
https://github.com/openbmc/docs/blob/master/contributing.md#coding-style and
https://github.com/openbmc/docs/blob/master/contributing.md#submitting-changes

I've added further comments inline.

Thanks,

Cyril

> From: ratagupt <ratagupt@in.ibm.com>
> 
> ---
>  chassishandler.C | 59 ++++++++++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 47 insertions(+), 12 deletions(-)
> 
> diff --git a/chassishandler.C b/chassishandler.C
> index fca3c79..1a5508f 100644
> --- a/chassishandler.C
> +++ b/chassishandler.C
> @@ -92,7 +92,7 @@ finish:
>      return r;
>  }
>  
> -int dbus_get_property(char **buf)
> +int dbus_get_property(const char *name,char **buf)

The style guide recommends spaces between parameters.

>  {
>      sd_bus_error error = SD_BUS_ERROR_NULL;
>      sd_bus_message *m = NULL;
> @@ -128,7 +128,7 @@ int dbus_get_property(char **buf)
>                             &m,                                         /* return message on success */
>                             "ss",                                       /* input signature */
>                             host_intf_name,                             /* first argument */
> -                           "boot_flags");                              /* second argument */
> +                           name);                                      /* second argument */
>  
>      if (r < 0) {
>          fprintf(stderr, "Failed to issue method call: %s\n", error.message);
> @@ -161,7 +161,7 @@ finish:
>      return r;
>  }
>  
> -int dbus_set_property(const char *buf)
> +int dbus_set_property(const char * name,const char *value)
>  {
>      sd_bus_error error = SD_BUS_ERROR_NULL;
>      sd_bus_message *m = NULL;
> @@ -196,16 +196,16 @@ int dbus_set_property(const char *buf)
>                             &m,                                         /* return message on success */
>                             "ssv",                                      /* input signature */
>                             host_intf_name,                             /* first argument */
> -                           "boot_flags",                               /* second argument */
> +                           name,                                       /* second argument */
>                             "s",                                        /* third argument */
> -                           buf);                                       /* fourth argument */
> +                           value);                                       /* fourth argument */

I'm not really sure why the /* {nth} argument */ comments but since they're
there please try to keep them aligned...

>  
>      if (r < 0) {
>          fprintf(stderr, "Failed to issue method call: %s\n", error.message);
>          goto finish;
>      }
>  
> -    printf("IPMID boot option property set: {%s}.\n", buf);
> +    printf("IPMID boot option property set: {%s}.\n", value);
>  
>  finish:
>      sd_bus_error_free(&error);
> @@ -374,7 +374,8 @@ char* get_boot_option_by_ipmi(uint8_t p) {
>  }
>  
>  #define SET_PARM_VERSION 1
> -#define SET_PARM_BOOT_FLAGS_VALID   0x80
> +#define SET_PARM_BOOT_FLAGS_VALID_ONE_TIME   0x80
> +#define SET_PARM_BOOT_FLAGS_VALID_PERMANENT  0xC0
>  
>  ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
>                                ipmi_request_t request, ipmi_response_t response, 
> @@ -391,7 +392,7 @@ ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>      memset(resp,0,sizeof(*resp));
>      resp->version   = SET_PARM_VERSION;
>      resp->parm      = 5;
> -    resp->data[0]   = SET_PARM_BOOT_FLAGS_VALID;
> +    resp->data[0]   = SET_PARM_BOOT_FLAGS_VALID_ONE_TIME;
>  
>      *data_len = sizeof(*resp);
>  
> @@ -401,10 +402,11 @@ ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>       */
>      if (reqptr->parameter == 5) {
>  
> -        int r = dbus_get_property(&p);
> +        /* Get the boot device */
> +        int r = dbus_get_property("boot_flags",&p);
>  
>          if (r < 0) {
> -            fprintf(stderr, "Dbus get property failed for get_sys_boot_options.\n");
> +            fprintf(stderr, "Dbus get property(boot_flags) failed for get_sys_boot_options.\n");
>              rc = IPMI_CC_UNSPECIFIED_ERROR;
>  
>          } else {
> @@ -412,8 +414,31 @@ ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>              s = get_ipmi_boot_option(p);
>              resp->data[1] = (s << 2);
>              rc = IPMI_CC_OK;
> +
> +        }
> +
> +        if (p)
> +        {
> +          free(p);
> +          p = NULL;
> +        }

Just fyi free() will happily accept NULL as an argument and simply do nothing.

> +
> +        /* Get the boot policy */
> +        r = dbus_get_property("boot_policy",&p);
> +
> +        if (r < 0) {
> +            fprintf(stderr, "Dbus get property(boot_policy) failed for get_sys_boot_options.\n");
> +            rc = IPMI_CC_UNSPECIFIED_ERROR;
> +
> +        } else {
> +
> +            printf("BootPolicy is[%s]", p); 
> +            resp->data[0] = (strcmp(p,"ONETIME")==0)?SET_PARM_BOOT_FLAGS_VALID_ONE_TIME:SET_PARM_BOOT_FLAGS_VALID_PERMANENT;

Wow, could you please make use of the spacebar and perhaps the enter key?

Also, just to be safe it would be best of use strncmp.
For example strncmp(p, "ONETIME", strlen("ONETIME"))

> +            rc = IPMI_CC_OK;
> +
>          }
>  
> +
>      } else {
>          fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
>      }
> @@ -455,13 +480,23 @@ ipmi_ret_t ipmi_chassis_set_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>  
>          } else {
>  
> -            int r = dbus_set_property(s);
> +            int r = dbus_set_property("boot_flags",s);
>  
>              if (r < 0) {
> -                fprintf(stderr, "Dbus set property failed for set_sys_boot_options.\n");
> +                fprintf(stderr, "Dbus set property(boot_flags) failed for set_sys_boot_options.\n");
>                  rc = IPMI_CC_UNSPECIFIED_ERROR;
>              }
>          }
> +      
> +        /* setting the boot policy */
> +        s= (char *)(((reqptr->data[0] & 0x40) == 0x40) ?"PERMANENT":"ONETIME");

Firstly if you declare s as a 'const char *' (which by the looks of things it
probably should be anyway...) then you won't need the cast. Why introduce 0x40?
Wouldn't it be cleaner to just do

if ((reqptr->data[0] & SET_PARM_BOOT_FLAGS_VALID_PERMANENT) ==
                      SET_PARM_BOOT_FLAGS_VALID_PERMANENT)
	s = "PERMANENT";
else
	s = "ONETIME";


> +        printf ( "\nBoot Policy is %s",s); 
> +        int r = dbus_set_property("boot_policy",s);
> +
> +        if (r < 0) {
> +            fprintf(stderr, "Dbus set property(boot_policy) failed for set_sys_boot_options.\n");
> +            rc = IPMI_CC_UNSPECIFIED_ERROR;
> +            }
>  
>      } else {
>          fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
