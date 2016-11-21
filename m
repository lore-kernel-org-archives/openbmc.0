Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgD82tPCzDvjP
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:27:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SZsp1u+5"; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id u15so1449466oie.3
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=AdPPfyz4QGOtgIy1mOQVWPWRrzINzaAVzFdwtwXSFls=;
 b=SZsp1u+5n7K3nu7gKKsmkJ1Dv2klbx5TTCKmaEB4DYNCy6wdYrJAVzAC6Yc5nR/a87
 H4VrKTNKBiqZk8mtEeZjdt4TsiSON7HzHumPbL8jGU1GIyWEizn82AKD2VZRSPS2a2bA
 Tq2o4Axnmq2QWo3d5PoahKG8Z05F08oRH0RPtt9nst5+jBWHvr2xkMhh3MO09FKqDksv
 ZxXUe2+t7OykBf8HNoZPQySuCBV7OjTb9HY72ynEe/xyUVI2NWYKQ5eEonLWco48UiAX
 pbzD++tH9Knk6KNUoDiiNFr0kGbxtUjrnWX2pW0AJTxE+aCqrCgHp+XWX63w0R3g3gi6
 46Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=AdPPfyz4QGOtgIy1mOQVWPWRrzINzaAVzFdwtwXSFls=;
 b=FFIiW46BxD2B0eQKukE7cE35OyNu4Yz+UV9whX8GYXWXurk7TSj+qyANsad1OvUkJM
 OUOB05SczsoWz3G9eevT6VRvlY3P2j1PQD17L+XIVQfksPkOcasDjp4kXGdEOq9t+rOn
 sZ9Ppj48NJ4GSbMTsjkrplfK4+Ez1y0J0KnlYHID/CMLJopFNI7u7wz5GdGysZe4AAK7
 Kkt+4kvDxjYI65iMkZ0TO6EWCotuMuTkniU3lsUfOvPAhlQTSe+2qi99R8E+VGZpDE+Y
 19r2vWqpWdmqJ+fwUkaiBdchPQ3rUb9S5WEnboVhLWoQ1JwmV+cNsK6DwKLaPcHVySVJ
 I+Dg==
X-Gm-Message-State: AKaTC02pEa6Y3oTKUsTqKV8j0fUkLRN1RCRzeU1ptLvUhR351Ytaror2iJRCcRVzU+njD0rSZGwKZWKv2YBPdA==
X-Received: by 10.157.27.65 with SMTP id l59mr7450567otl.196.1479713254719;
 Sun, 20 Nov 2016 23:27:34 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:27:14 -0800 (PST)
In-Reply-To: <1479478938-13267-30-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-30-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:57:14 +1030
X-Google-Sender-Auth: D7vaOW-R8A7t-w9GpEOy_y7y5qw
Message-ID: <CACPK8XcUkU=wD=q_fHdE1Wuvp6U+8Xo20pKM7ENuGyctSF=XWQ@mail.gmail.com>
Subject: Re: [PATCH qemu 29/38] aspeed: add a rtc device on I2C bus 0
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Nov 2016 07:27:37 -0000

On Sat, Nov 19, 2016 at 12:52 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> The palmetto platform has a ds3231 RTC device but not qemu. Let's use
> a ds1338 instead which provides enough basic RTC features. Only alarms
> will be missing
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/arm/aspeed_soc.c | 4 ++++
>  1 file changed, 4 insertions(+)
