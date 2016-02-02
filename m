Return-Path: <dja@axtens.net>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5B5411A001D
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2016 09:28:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b=WVx25VSx; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id n128so96702pfn.3
 for <openbmc@lists.ozlabs.org>; Tue, 02 Feb 2016 14:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:user-agent:date:message-id
 :mime-version:content-type;
 bh=mBLy+dlmiuWsD9k+z/SloofxqR5Bwp/FUzs9tCVhuII=;
 b=WVx25VSxzZV1bHxjf8umZNiPxACMZMx6zC8rSKi3o0ouNH8cqy47RvmEYtXVH0hOKt
 NC/f6h3F2TACA76p2XvDNPPepIMOVwvcJoIaGr/gX2jY4KQ5MoDBmtvDn8u+viE5x1Fw
 ao4DdiQYYW+KjXNrmM+lHw5MifrTyMnwWeNNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:in-reply-to:references
 :user-agent:date:message-id:mime-version:content-type;
 bh=mBLy+dlmiuWsD9k+z/SloofxqR5Bwp/FUzs9tCVhuII=;
 b=StiUKDDlppFfah15C2HT1N6eAzgJ23dOtFmeuXcu2qlLOtK2mNE3PSHK/zKQPQEH3x
 dEKtNyUnLyqIN2t4SwgKDc0D7UWRb4xdTX5ClYuCek2F0Ksq9+GHpvzBePGDZWmntpxA
 hobgn0R0hLOBpU5pIfpEcjkPcvBo0ByQkLn+6sXZIcD/iwxTUrEn2FGlsn/zc+fq/tpf
 vvy1vH1iin/7QZUN2ctJuwyJU4jxmuEPjL3LyzgFp9C6IUWH9jnzDLt9uoo/SecyV8ip
 ejk62px+V70Lm8gqpAwt5Rz0WAOGFYnoBZuaqLh8bPd7J6LgXmqd1IF2qKQxExqB7Cvw
 LKlQ==
X-Gm-Message-State: AG10YOSv9r59gPScbCI/hL9nODdI6qc64R/npNnXu/dBP+9dWL+3iwg4Wb/w0wKkd9DpAw==
X-Received: by 10.98.7.14 with SMTP id b14mr25703711pfd.40.1454452087205;
 Tue, 02 Feb 2016 14:28:07 -0800 (PST)
Received: from localhost ([138.44.250.25])
 by smtp.gmail.com with ESMTPSA id ss5sm4914918pab.15.2016.02.02.14.28.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Feb 2016 14:28:06 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH skeleton 2/2] Makefile changes to fix LED build failures
 in bitbake
In-Reply-To: <1454401846-16840-3-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454401846-16840-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454401846-16840-3-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-pc-linux-gnu)
Date: Wed, 03 Feb 2016 09:28:02 +1100
Message-ID: <87lh72iw7h.fsf@gamma.ozlabs.ibm.com>
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
X-List-Received-Date: Tue, 02 Feb 2016 22:28:11 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:

> From: vishwa <vishwanath@in.ibm.com>
>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
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

Would this be better as $(CFLAGS) rather than $(INCLUDES)?

Regards,
Daniel

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
> -- 
> 2.6.4
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
