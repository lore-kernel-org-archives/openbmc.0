Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A2A371A0023
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2016 09:58:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=A0ee3Tbv; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id e65so12306729pfe.0
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jan 2016 14:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding;
 bh=bqBDMSoEpqWck7rSXnn5Fr8qSLvAzkVnebCGrGnz5VU=;
 b=A0ee3TbvZW7s35A/wn/i4TmyRf750dj5zsafPjevacs35mWP8II1OB27pJmdoDj3CQ
 WJMCzcvfJuTcrgnqt6K0S294EoHV754z89V2Xh9N8VXJMqAXYQ+cfdFCGQaLiuJKsWXc
 WS4ptI6IC6yKDn9AsHwDrIhW5qWrZ0NS+JoB7aus9jPUivByrSm5ZNDi81gMBpEYCNRN
 gTKy3KXeI2U+hwGV9jP5Wb8Oemj2zxwSCKRzAls4oT0umfOGtlNwjoTfuEYGvqcSmvQl
 m9Kfq6RJvYTXG7vd8U5/5rbYKosybGEx4OHW0Vy3DZ45PB8qxtnHILEKN/+i53tGnnNN
 aIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-type:content-transfer-encoding;
 bh=bqBDMSoEpqWck7rSXnn5Fr8qSLvAzkVnebCGrGnz5VU=;
 b=dtpNgu7iuopZPRkJHcpZw1+2FOwX0FkS1oEdh2Kpdut1fZbUqTM2Dl884iE/8GaLda
 oLV8KEGN56yM+cFyLzQ5LBt4PYWIia8rpSqZ+jXTfuyFO0vl8Te+zXtUVU+sSGCGeNKK
 2qQUmuPtu2kCYTx4TxQbjG0nP16VJzmRll90x7VQirsmgrZ4tREZYYVxkqm9ORFWgeCa
 Mc9zbGtQWRU7IAB/horGxxeJXlzR9ZxjMSO02fDr+qGqqJPvoPWMHMgMTeijoV78jxNe
 VyhTB8u8JbYdPv6kTkxNz3fRwfLltXG7dQmuWly7HoRquNRn70dXOZKsqTUDnBmrU4fF
 9WhA==
X-Gm-Message-State: ALoCoQnNjoPZkJ35kN/2rS/OSvq2TvuJ6FSBOiKW+ocNpIc1aTvol3HdB2lCSvuTBku0oPP8kswLW294cvsrnBhJoy6nbrRVkw==
X-Received: by 10.98.80.135 with SMTP id g7mr40064610pfj.132.1453157906515;
 Mon, 18 Jan 2016 14:58:26 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id dz12sm36550773pac.2.2016.01.18.14.58.24
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 18 Jan 2016 14:58:26 -0800 (PST)
Date: Tue, 19 Jan 2016 09:58:18 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, Ken <ken.sk.lai@mail.foxconn.com>
Subject: Re: [PATCH skeleton v3 4/4] Solve auto power on issue, confirm GPIO
 status before send the signal
Message-ID: <20160119095818.3e7c3193@camb691>
In-Reply-To: <1452772237-6542-5-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452772237-6542-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1452772237-6542-5-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 18 Jan 2016 22:58:29 -0000

On Thu, 14 Jan 2016 05:50:37 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Ken <ken.sk.lai@mail.foxconn.com>
> 

Hi Ken,

Just a few comments mostly around style here, Jeremy has gone to some effort to
put up some docs on guidelines to follow when sending patches:
https://github.com/openbmc/docs/blob/master/contributing.md

Please be careful with whitespace changes, you have a few lines in your diff
that are functionally equivalent but just change whitespace.

If you do want to clean up whitespace problems, no objections but please have
them changes in a separate patch.

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

The benefit of using version control is that code can simply be deleted when it
is need to be non functional but will exist forever in the history and can
easily be looked up if/when it is needed again.

If you want to remove code even temporarily, please delete it.

> +			rc1 =  gpio_open(&gpio_button);
> +			rc1 = gpio_read(&gpio_button,&val);
> +			if (val == 1)
> +			button_emit_released(button);

Please indent.

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
