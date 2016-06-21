Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x236.google.com (mail-qk0-x236.google.com
 [IPv6:2607:f8b0:400d:c09::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYgjC6R5QzDq5c
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 18:23:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=JC0wa5Wp; 
 dkim-atps=neutral
Received: by mail-qk0-x236.google.com with SMTP id p10so10900061qke.3
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 01:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=YXGGjB8h2pCLmsqUugh4vFfHXVLW+xDPA7gW+XPcvEg=;
 b=JC0wa5WpAxmHO2rqO6CRofjsIT6xJ/7IH3Zt2OHrfg8AKDuz1sghE1sJCPhfj9QKnW
 nv1Thgz1uPuzsJbi5aAdNmq+HKHQvdh23wJRbCCXWNej7CdBWEtiwvByhISnm7tAtDzL
 zR5ei4oTRZ4iTYWFH8N+/kCKpe9T9Ra82w9rP18AzLPaGBWf8GfKiidJdWQZhWm6L1ja
 j/N5XtWW2yH1Ui5JrUk61I5vXmQbBtleZi1ub1nASNL0vZRUO0F3SdaHKtInRlfRB8aD
 SK8GZgjZRdwawEOegJ4uvcWBLjYxQujpZO4jJ7jTWwGiYTtAptiXNfHV1vMFxPHzeTfP
 pwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=YXGGjB8h2pCLmsqUugh4vFfHXVLW+xDPA7gW+XPcvEg=;
 b=hQEYy+MT0JCJ2z6QA/2Dq35kPlKnTmoxYXdBAC0gdYYY6v9oy4UE5khaavxPGcDCqc
 p/JOu/2wo1GOvr5MUBwVV6KS+sSeC6qynKFGIERyIM4WWp328SimdLSrJTrl7tys55Se
 Oo5W0Nz1RYssKyjXIB2ZSNEOP6DG4GlM42wnmsIoskZ2mPuNgIh9+CY7jVoWJzE224yj
 7scfLnX7m0gpTbvAigkvA6RONNWm+nYDVtDmMNA1dbztKUf2dEIguCJNuz6o/Ots7UY+
 R67Z3AJ28ErfTNlWTa69oekgEd4enKAwYLS9lfouKVViIW3Ny7oWXQnKqkohsKi7E11h
 Cjyw==
X-Gm-Message-State: ALyK8tJ729KEgMSrH8cijbJFvRzUN9KVMuLDkxUTNSbkNShmZ9Yx6fSETr+RhYfvvPfmMd14gj85IQX4O5bvzg==
X-Received: by 10.55.104.213 with SMTP id d204mr27586171qkc.208.1466497405826; 
 Tue, 21 Jun 2016 01:23:25 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Tue, 21 Jun 2016 01:23:06 -0700 (PDT)
In-Reply-To: <bbb0ddc2-2dcf-7d3e-a33b-66d3f04f45e9@kaod.org>
References: <1466494185-24459-1-git-send-email-joel@jms.id.au>
 <1466494185-24459-2-git-send-email-joel@jms.id.au>
 <bbb0ddc2-2dcf-7d3e-a33b-66d3f04f45e9@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Jun 2016 17:53:06 +0930
X-Google-Sender-Auth: qez2xisK2XtPVZVkytcGNG5Ej3I
Message-ID: <CACPK8XdDq+ACJA=U=33dW_41F=dxnekCMJ370HCtsTi6BwqBnQ@mail.gmail.com>
Subject: Re: [u-boot 1/3] ast-g5: Simplify config and board file
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Teddy Reed V <teddy.reed@gmail.com>, Andrew Jeffery <andrew@aj.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jun 2016 08:23:28 -0000

On Tue, Jun 21, 2016 at 5:28 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>> -#define CONFIG_SYS_LOAD_ADDR         0x83000000      /* default load ad=
dress */
>> +#define CONFIG_SYS_LOAD_ADDR 0x83000000      /* default load address */
>>
>>  #define CONFIG_BOOTARGS              "console=3DttyS0,115200n8 ramdisk_=
size=3D16384 root=3D/dev/ram rw init=3D/linuxrc mem=3D80M"
>
> May be we could change these CONFIG_BOOTARGS to a OpenBMC one, which is m=
ore
> standard :
>
>         "console=3DttyS4,115200n8 root=3D/dev/ram rw"
>
> That can be other patch.

Agreed, I'll make that change.

Actually, the Google guys have already made that change and I pushed
it to the tree openbmc/u-boot#2016.05-ast2500.

 https://github.com/openbmc/u-boot/commit/3ec6f724873fb197d3226b5c9f4e81621=
ff978cf

I will ensure that patch is in the branch I create.

>>  /* --------------------------------------------------------------------=
----- */
>> @@ -183,48 +156,12 @@
>>  #define CONFIG_PHY_ADDR                      0
>>  #define CONFIG_PHY_REALTEK
>>  #endif
>> -
>>  #ifdef CONFIG_CMD_NET
>> -/* #define CONFIG_MAC_NUM    2 */
>>  #define CONFIG_FTGMAC100
>>  #define CONFIG_PHY_MAX_ADDR  32      /* this comes from <linux/phy.h> *=
/
>> -/* #define CONFIG_SYS_DISCOVER_PHY */
>>  #define CONFIG_FTGMAC100_EGIGA
>
> So the aspeednic is only in the witherspoon branch ? (which is better if =
so)

Currently, yes. I will pull the aspeednic driver into our branch and
create a separate machine for witherspoon. That way we can continue
using the same branch while Gavin and I develop a u-boot ncsi stack.

Thanks for the review.

Cheers,

Joel
