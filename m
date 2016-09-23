Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x242.google.com (mail-ua0-x242.google.com
 [IPv6:2607:f8b0:400c:c08::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgPnz2YnKzDsl3
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 17:17:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=S8urjmC5; 
 dkim-atps=neutral
Received: by mail-ua0-x242.google.com with SMTP id 51so1083241uac.1
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 00:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Xhn1uCAPYOaFBU6aH1dRkz6SwfXWnyOJh+cgQwLoPsI=;
 b=S8urjmC59+6ehnMklCGZKfyeIyY/RZm9XPziOCYXJ8QhJpTFhYway1WOhdLq7FE0Dt
 UTlC6Z5PvxwHOr3T48U2TzRHKeIZus6hjWiYS0xRmQCnF/yEYBLmUSUA3mplgKtlBZ/y
 7/4XB9V/T9T8AJfsEtP7yZumgGiGxDWachEVSsvuS1VY9rjNSg2ysoWO9ykSadmUlKYl
 5ASKMrePKh58OzOQDHbCxAdIizIT+bx+aiSTVHgy3aVLVA/JOydeO6sPAcMi0CoZYIp+
 Chl+dnluBwMCF9CCDBNZG3McicKSOy6n5LznRYDaDL+GHX/Zum2+ACecapooUWXy6qfg
 4eyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Xhn1uCAPYOaFBU6aH1dRkz6SwfXWnyOJh+cgQwLoPsI=;
 b=kJzBIeFfg/QH7BGyqOvsbRmAps8xqdfA2mfXhqF6o6W+OIsr+k6MqfWuYC5oksR4vJ
 seLiN77xMdKH5tMZastejyVVwFnZGQ1Rft1bB3V175ADyG9KTlqOTXSvVYvYdzA0dNHj
 Msa5KS+kx4gKnuXs1KYgrstmeQH4DbvljoxNg3U28NRKsmfk7OM+sU2Ny175XyjDUtYM
 rSikmsu+PfxgvIl/9XPx56T+75JCFRMcJF91wdwwlQrGhZ+GSOUphRsZFWr6yYIn9x7Y
 k8fKJ82ZoqulynvI5Tz1BW+Mm2f5WfwnBObDfDJovxaRNAFP+SyFNLA/CVJhT08EGqxV
 CSjQ==
X-Gm-Message-State: AE9vXwOcjNXIX0fhY4ouHgg3cU7aGqD2N/8dHEVDx9Bw0/Kg7TdjfaUEnrMgX4/Zwu1f9drHz/jEjtCY2i+5Hg==
X-Received: by 10.159.35.21 with SMTP id 21mr2501137uae.48.1474615061417; Fri,
 23 Sep 2016 00:17:41 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Fri, 23 Sep 2016 00:17:20 -0700 (PDT)
In-Reply-To: <1474058133-27363-14-git-send-email-tpearson@raptorengineering.com>
References: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
 <1474058133-27363-14-git-send-email-tpearson@raptorengineering.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 23 Sep 2016 16:47:20 +0930
X-Google-Sender-Auth: mavwHksteXgUGwHytuo8-KNYPsA
Message-ID: <CACPK8XfA0UCCV6HhKWfHzfT_5==7CzF97ff_Ptkh8jCUwOUcKw@mail.gmail.com>
Subject: Re: [PATCH 13/17] Enable I2C hub and connected devices in Firestone DT
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 23 Sep 2016 07:17:44 -0000

On Sat, Sep 17, 2016 at 6:05 AM, Timothy Pearson
<tpearson@raptorengineering.com> wrote:
> Firestone contains an I2C hub with mostly uninteresting
> (i.e. manufacturing only) devices, except for the main
> chassis fan controller.  Add this hub and the fan controller
> to the device tree in anticipation of a Linux driver for the
> fan controller.
>
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>

Applied to dev-4.7 as 8bb42b321129916ba8827e807949eb9a56061781.

Cheers,

Joel
