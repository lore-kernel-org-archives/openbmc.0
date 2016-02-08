Return-Path: <dja@axtens.net>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7DCD21A0190
 for <openbmc@lists.ozlabs.org>; Mon,  8 Feb 2016 23:28:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b=GYdlreeA; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id 66so8602924pfe.2
 for <openbmc@lists.ozlabs.org>; Mon, 08 Feb 2016 04:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:user-agent:date:message-id
 :mime-version:content-type;
 bh=vh0ezPAH/i5Sg2qNKOg/HF0pCF9WpXfgzruCv8BjP+E=;
 b=GYdlreeAmpjNrt058ptX5fwVZQymeebT5FJvsaZX86C7gwZb27tBMvUxlz1cnMvaTb
 zkXGN0gLMf4w7Ez57bTpktcp4dZmbf2Pwsv3neJEJBVHKTq1mDI7LcemUftenIQ7YsCF
 NxV3H5Mh83rGvP3SXPlGy2GoTjMNrz1CLGmyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:in-reply-to:references
 :user-agent:date:message-id:mime-version:content-type;
 bh=vh0ezPAH/i5Sg2qNKOg/HF0pCF9WpXfgzruCv8BjP+E=;
 b=ZGStraUWxLSABJ+dvQ2TdyW8Pbvq5TPSvL1dCdPnHUHItPbeA6PLYHWsxBDP3mdp0B
 +gAwbAv9RQ8U6v+wFeJTizLXtA+hHP9P+JKpAYKK+4Lou+SdsL5eW00IXeYJc/NTlhhp
 k7gVwDGEh3wWO0y2T5QdPeTXYPiKwwgjpsOD4QTLJMxBvSbGGfh6NFdAA87okqB6C/SQ
 II6EhfhDmZPzlg78sKI6kGcVQm2KSpxnf4FPDkwEnUfq3czuWmSWiYVR2kSIUm/L83Ul
 QoA4O2Y8Ytev4F0L3ESar09k3A3wGcd+Ulr+yOcVBsZ/oTEuXIcsXyc9RlzgkZ8x+EQ8
 M+kw==
X-Gm-Message-State: AG10YOS15mfJapUjwBEfT2sb8+K4c1n98fbl5XG/pyBwpZ7DnepqzmgmXbskAeVohw1DHQ==
X-Received: by 10.98.9.129 with SMTP id 1mr42272039pfj.163.1454934520878;
 Mon, 08 Feb 2016 04:28:40 -0800 (PST)
Received: from localhost ([1.144.31.113])
 by smtp.gmail.com with ESMTPSA id bx1sm43243856pab.33.2016.02.08.04.28.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Feb 2016 04:28:40 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH skeleton v2 2/2] Makefile changes to fix LED build
 failures in bitbake
In-Reply-To: <1454667639-12905-3-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454667639-12905-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454667639-12905-3-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-pc-linux-gnu)
Date: Mon, 08 Feb 2016 23:28:35 +1100
Message-ID: <877fifl72k.fsf@gamma.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
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
X-List-Received-Date: Mon, 08 Feb 2016 12:28:45 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:

> From: vishwa <vishwanath@in.ibm.com>
>
> ---
>  Makefile                     |  4 ++--
>  objects/led_controller_new.c | 37 +++++++++++++++----------------------

It seems like you're doing makefile change and whitespace changes? Would
it be possible to split them into two patches please?

Thanks :)

Regards,
Daniel

>  2 files changed, 17 insertions(+), 24 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index e787990..1a8e88e 100755
> --- a/Makefile
> +++ b/Makefile
> @@ -6,7 +6,7 @@ OBJS2   = progress.o ast-sf-ctrl.o libflash.o libffs.o arm_io.o
>  OBJS3   = obj/progress.o obj/ast-sf-ctrl.o obj/libflash.o obj/libffs.o obj/arm_io.o
>  INCLUDES=$(shell pkg-config --cflags gio-unix-2.0 glib-2.0) -Iincludes -Iobjects/pflash -I.
>  LIBS=$(shell pkg-config --libs gio-unix-2.0 glib-2.0) -Llib -lopenbmc_intf
> -INC_FLAG += $(shell pkg-config --cflags --libs libsystemd) -I. -O2
> +INCLUDES += $(shell pkg-config --cflags --libs libsystemd) -I. -O2
>  LIB_FLAG += $(shell pkg-config  --libs libsystemd)
>  
>  %.o: interfaces/%.c 
> @@ -42,7 +42,7 @@ led_controller: led_controller.o gpio.o object_mapper.o libopenbmc_intf
>  	$(CC) -o bin/$@.exe obj/gpio.o obj/led_controller.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
>  
>  led_controller_new: led_controller_new.o
> -	$(CC) $(INC_FLAG) -o bin/$@.exe obj/led_controller_new.o $(LDFLAGS) $(LIBS) $(LIB_FLAG)
> +	$(CC) -o bin/$@.exe obj/led_controller_new.o $(LDFLAGS) $(LIB_FLAG)
>  
>  button_power: button_power_obj.o gpio.o object_mapper.o libopenbmc_intf
>  	$(CC) -o bin/$@.exe obj/button_power_obj.o obj/gpio.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
> diff --git a/objects/led_controller_new.c b/objects/led_controller_new.c
> index c8b3f92..0eac7a8 100755
> --- a/objects/led_controller_new.c
> +++ b/objects/led_controller_new.c
> @@ -48,7 +48,7 @@ int write_to_led(const char *name, const char *ctrl_file, const char *value)
>      char led_path[128] = {0};
>  
>      int len = 0;
> -    len = snprintf(led_path, sizeof(led_path), 
> +    len = snprintf(led_path, sizeof(led_path),
>                     "/sys/class/leds/%s/%s",name, ctrl_file);
>      if(len >= sizeof(led_path))
>      {
> @@ -59,16 +59,14 @@ int write_to_led(const char *name, const char *ctrl_file, const char *value)
>      FILE *fp = fopen(led_path,"w");
>      if(fp == NULL)
>      {
> -        perror("Error:");
> -        fprintf(stderr,"Error opening:[%s]\n",led_path);
> +        fprintf(stderr,"Error:[%s] opening:[%s]\n",strerror(errno),led_path);
>          return rc;
>      }
>  
>      rc = fwrite(value, strlen(value), 1, fp);
>      if(rc != 1)
>      {
> -        perror("Error:");
> -        fprintf(stderr, "Error writing to :[%s]\n",led_path);
> +        fprintf(stderr, "Error:[%s] writing to :[%s]\n",strerror(errno),led_path);
>      }
>  
>      fclose(fp);
> @@ -129,11 +127,11 @@ static int led_function_router(sd_bus_message *msg, void *user_data,
>          char value_str[10] = {0};
>          const char *led_state = NULL;
>  
> -        rc = read_led(led_name, power_ctrl, value_str, sizeof(value_str));
> +        rc = read_led(led_name, power_ctrl, value_str, sizeof(value_str)-1);
>          if(rc >= 0)
>          {
> -            /* LED is active low */
> -            led_state = strtoul(value_str, NULL, 0) ? "Off" : "On";
> +            /* LED is active HI */
> +            led_state = strtoul(value_str, NULL, 0) ? "On" : "Off";
>          }
>          return sd_bus_reply_method_return(msg, "is", rc, led_state);
>      }
> @@ -156,12 +154,12 @@ int led_stable_state_function(char *led_name, char *led_function)
>      int rc = -1;
>  
>      const char *value = NULL;
> -    if(strcmp(led_function, "setOn") == 0)
> +    if(strcmp(led_function, "setOff") == 0)
>      {
> -        /* LED active low */
> +        /* LED active HI */
>          value = "0";
>      }
> -    else if(strcmp(led_function, "setOff") == 0)
> +    else if(strcmp(led_function, "setOn") == 0)
>      {
>          value  = "255";
>      }
> @@ -272,11 +270,11 @@ int led_default_blink(char *led_name, char *blink_type)
>   * Gets the current value of passed in LED file
>   * Mainly used for reading 'brightness'
>   * NOTE : It is the responsibility of the caller to allocate
> - * sufficient space for buffer. This will read upto user supplied 
> + * sufficient space for buffer. This will read upto user supplied
>   * size -or- entire contents of file whichever is smaller
>   * ----------------------------------------------------------------
>   */
> -int read_led(const char *name, const char *ctrl_file, 
> +int read_led(const char *name, const char *ctrl_file,
>               void *value, const size_t len)
>  {
>      /* Generic error reporter. */
> @@ -293,7 +291,7 @@ int read_led(const char *name, const char *ctrl_file,
>      char led_path[128] = {0};
>  
>      int led_len = 0;
> -    led_len = snprintf(led_path, sizeof(led_path), 
> +    led_len = snprintf(led_path, sizeof(led_path),
>                     "/sys/class/leds/%s/%s",name, ctrl_file);
>      if(led_len >= sizeof(led_path))
>      {
> @@ -304,8 +302,7 @@ int read_led(const char *name, const char *ctrl_file,
>      FILE *fp = fopen(led_path,"rb");
>      if(fp == NULL)
>      {
> -        perror("Error:");
> -        fprintf(stderr,"Error opening:[%s]\n",led_path);
> +        fprintf(stderr,"Error:[%s] opening:[%s]\n",strerror(errno),led_path);
>          return rc;
>      }
>  
> @@ -314,7 +311,6 @@ int read_led(const char *name, const char *ctrl_file,
>      {
>          sysfs_value[count++] = fgetc(fp);
>      }
> -    sysfs_value[count]='\0';
>  
>      fclose(fp);
>      return 0;
> @@ -378,7 +374,7 @@ int start_led_services()
>          return rc;
>      }
>  
> -    count_leds = num_leds = scandir("/sys/class/leds/", 
> +    count_leds = num_leds = scandir("/sys/class/leds/",
>                                      &led_list, led_select, alphasort);
>      if(num_leds <= 0)
>      {
> @@ -427,11 +423,8 @@ int start_led_services()
>      while (count_leds > 0)
>      {
>          free(led_list[--count_leds]);
> -        if(count_leds == 0)
> -        {
> -            free(led_list);
> -        }
>      }
> +    free(led_list);
>  
>      /* If we had success in adding the providers, request for a bus name. */
>      if(rc == 0)
> -- 
> 2.6.4
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
