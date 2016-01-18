Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E175A1A0023
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2016 10:00:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=kITnkRJl; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id 65so12267017pff.2
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jan 2016 15:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding;
 bh=z1chn48xP0EghBUBkI1JXkFskp8a4gmCkUP8EAui02I=;
 b=kITnkRJlAkOxTtasoeGcswC/8kg8ovc/e1wc77F0hzg8jAe4XgOnamthOjSNaUMNvN
 915ri8g06DbrHHxlTbzKN87w1gXuDM19cxrQ98Kcvo35slLUNU7fIoTiDJ1AoV8tpzJB
 7f963S8ZaCY23IbzOnWlpGaCNlNnfDnYvALe8B96VBC88XyPsyySKkbwSXIRUb+IAT/Q
 m9HHlK7DNZRBIifwHeHiW5I8MwZL065IrpkHxkXNHor0NR2W8hEv825sw4ckvVuZevMJ
 AR0CS5zYe1c+9fNLwWFts1WQP9QNOGyaWSjMOIdT8UsC/8rGNctk+Hv0LQTEh7limr1z
 icLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-type:content-transfer-encoding;
 bh=z1chn48xP0EghBUBkI1JXkFskp8a4gmCkUP8EAui02I=;
 b=J62XXwUkK1HBrcs5AKuDEbNtBy5qzjHNn7nDNdywQEg91EdpiIO59mQ+3FvXv98uhh
 aSY/k6CowJ7dVcks+V5xy841xmzx6SPmgyAnoaFwcvJLSyieZppR0NQPDaX4wo4/bw4F
 1W3WSa9puTvsMs2+j8vjvv5XAktDEdYVJp5B3qdugGCAnzRmYALACmtD2CqsZkYrNdjF
 MaauKlBf1d/a7i6QYKmELz9KuIy1KwBm1brVSOGt06veiL8EoGnZIvxLrcRd1jvK1WJm
 /YO648avWp5eM5Lus/4cAP5ZzEINEucuK85GwuS2sXJxCc+oCrk/E4YUOXuQ/vaqLvtd
 K+RQ==
X-Gm-Message-State: ALoCoQn1Va/T63zgpY0GCNMILsx1CGIXL9nGba0JIwLLItLHdQJh4MYb6L2uV8MvbtFwgFkHDgIbTI2VhE6iSG025odyyWhwcw==
X-Received: by 10.98.70.17 with SMTP id t17mr39624667pfa.107.1453158010903;
 Mon, 18 Jan 2016 15:00:10 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id mj1sm36454867pab.34.2016.01.18.15.00.09
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 18 Jan 2016 15:00:10 -0800 (PST)
Date: Tue, 19 Jan 2016 10:00:03 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, Ken <ken.sk.lai@mail.foxconn.com>
Subject: Re: [PATCH skeleton v5 4/5] Solve auto power on issue, confirm GPIO
 status before send the signal
Message-ID: <20160119100003.00279380@camb691>
In-Reply-To: <1453084835-12886-5-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453084835-12886-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453084835-12886-5-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 18 Jan 2016 23:00:13 -0000

On Sun, 17 Jan 2016 20:40:34 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Ken <ken.sk.lai@mail.foxconn.com>
> 

Hi Ken,

Sorry I responded to this patch in v3 but my comments are still relevant here.

Apologies,

Cyril

> ---
>  objects/button_power_obj.c | 37 ++++++++++++++++++++++++-------------
>  1 file changed, 24 insertions(+), 13 deletions(-)
>  mode change 100644 => 100755 objects/button_power_obj.c
> 
> diff --git a/objects/button_power_obj.c b/objects/button_power_obj.c
> old mode 100644
> new mode 100755
> index 94f8922..4c986a1
> --- a/objects/button_power_obj.c
> +++ b/objects/button_power_obj.c
> @@ -1,4 +1,5 @@
>  #include <stdio.h>
> +#include <stdlib.h>
>  #include "interfaces/openbmc_intf.h"
>  #include "gpio.h"
>  #include "openbmc.h"
> @@ -42,7 +43,11 @@ on_button_interrupt( GIOChannel *channel,
>  
>  	GError *error = 0;
>  	gsize bytes_read = 0;
> -	gchar buf[2]; 
> +	gchar buf[2];
> +
> +	uint8_t val;
> +	int rc1 = GPIO_OK;
> +
>  	buf[1] = '\0';
>  	g_io_channel_seek_position( channel, 0, G_SEEK_SET, 0 );
>  	GIOStatus rc = g_io_channel_read_chars( channel,
> @@ -50,7 +55,7 @@ on_button_interrupt( GIOChannel *channel,
>                                              &bytes_read,
>                                              &error );
>  	printf("%s\n",buf);
> -	
> +
>  	time_t current_time = time(NULL);
>  	if (gpio_button.irq_inited)
>  	{
> @@ -65,19 +70,25 @@ on_button_interrupt( GIOChannel *channel,
>  		{
>  			long press_time = current_time-button_get_timer(button);
>  			printf("Power Button released, held for %ld seconds\n",press_time);
> -			if (press_time > LONG_PRESS_SECONDS)
> -			{
> -				button_emit_pressed_long(button);
> -			} else {
> -				button_emit_released(button);
> -			}
> +		//	if (press_time > LONG_PRESS_SECONDS)
> +		//	{
> +		//		button_emit_pressed_long(button);
> +		//	} else {
> +			rc1 =  gpio_open(&gpio_button);
> +			rc1 = gpio_read(&gpio_button,&val);
> +			if (val == 1)
> +			button_emit_released(button);
> +
> +			//	if (press_time > 1)
> +			//	sleep(1);
> +			//}
>  		}
> -	} 
> +	}
>  	else { gpio_button.irq_inited = true; }
>  
>  	return TRUE;
>  }
> -static void 
> +static void
>  on_bus_acquired (GDBusConnection *connection,
>                   const gchar     *name,
>                   gpointer         user_data)
> @@ -110,7 +121,7 @@ on_bus_acquired (GDBusConnection *connection,
>                      G_CALLBACK (on_button_press),
>                      NULL); /* user_data */
>  
> -		
> +
>  	/* Export the object (@manager takes its own reference to @object) */
>  	g_dbus_object_manager_server_export (manager, G_DBUS_OBJECT_SKELETON (object));
>  	g_object_unref (object);
> @@ -130,7 +141,7 @@ on_bus_acquired (GDBusConnection *connection,
>  	{
>  		printf("ERROR PowerButton: GPIO setup (rc=%d)\n",rc);
>  	}
> -	emit_object_added((GDBusObjectManager*)manager); 
> +	emit_object_added((GDBusObjectManager*)manager);
>  }
>  
>  static void
> @@ -171,7 +182,7 @@ main (gint argc, gchar *argv[])
>                         NULL);
>  
>    g_main_loop_run (loop);
> -  
> +
>    g_bus_unown_name (id);
>    g_main_loop_unref (loop);
>    return 0;
