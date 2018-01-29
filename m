Return-Path: <avifishman70@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::236; helo=mail-ot0-x236.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="p8ccF/u5"; 
 dkim-atps=neutral
Received: from mail-ot0-x236.google.com (mail-ot0-x236.google.com
 [IPv6:2607:f8b0:4003:c0f::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zVR36452XzDqsn
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jan 2018 21:44:34 +1100 (AEDT)
Received: by mail-ot0-x236.google.com with SMTP id p36so6080960otd.10
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jan 2018 02:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=V3nSi8tDHA+nvvvjJxDTdogFTlsi+b8svPVIgvjSw9Q=;
 b=p8ccF/u5NTXTbH0U3lijTCtGR671BEinzLeh+K9lH4Xz25NrD63gVOtJnhDytOvn1y
 NeIJ1MwabR/k4j4ggtQ5lgGTPsCH3TcnuwdKchthqOIvzegr3P9CGDZMaiKLTM9Q84rc
 wrp4q+di7J6Yy0Ie6082ed/ROEmo9cDVRq43LMQDIOdID8Y0Wre+vHITKCModvIgqgIv
 2u1xevPyGAY0Iq+eqOYRvBnc6lzTPAbttOJv2Kca9EDWg/GE/TcIcGMMZ0lEBcwDamPa
 33ZRJ4FWqFQPaOmVGMeTAQoZZkFAgNfFfNhrA6oBJqRvZC3uOxbGWFZd66l1JNIcrTaW
 7Zqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=V3nSi8tDHA+nvvvjJxDTdogFTlsi+b8svPVIgvjSw9Q=;
 b=pkf9ziRPjsS9JkA3EALnbIW5HhbrigJhoQcynHi/JYFbADUveQWD22GpsQMvLRrogv
 HX/3hdfJa6iJX+776Pbflsd+Qwn6rV9Le05wei5YpWP+7kF6EfXtuenJH5Tyn35Bh2A1
 6JupKHnxwUQ+wahEThP1W1P49QEwmL7wgpHEaOVb1RUjKsC6A1t+f0LfFEa9fN15MiYs
 dnGZy2mFT1cLWC869QXFddvROSOXIp17ZLLq5OUSqbveuTVvUWYGMdpG+maEoJW/5XqN
 gbqaubvvOJ/sLIUClL14Q1Hzp3Vvlzf9e3hs6ye3YiUIBYRCe4i1TYvthVShn7YzWx69
 hP+g==
X-Gm-Message-State: AKwxytc7zG0bwi7VZeuezmzMAGAxpA1//+fq5/bNSeWo1aWFJpifc8tk
 KbQHH4PW9eovIa1NsxfT+2VbYs0k/tfRStopNQ==
X-Google-Smtp-Source: AH8x2276rCXDx/90F6fQ5AqmOAQFng38/hNLX/j3MeaZ/smwG1Gwzl+1bAfudnAO9DkMaIx6iOuHTlv9QP9OCzFVt+A=
X-Received: by 10.157.63.225 with SMTP id i30mr4879306ote.51.1517222672397;
 Mon, 29 Jan 2018 02:44:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.38.10 with HTTP; Mon, 29 Jan 2018 02:44:31 -0800 (PST)
In-Reply-To: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
References: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Mon, 29 Jan 2018 12:44:31 +0200
Message-ID: <CAKKbWA4E+bX6WiEDGUYED=nUegJ9N7cTcxZHMpfiO43Tt0dNyw@mail.gmail.com>
Subject: Re: BMC Image Signing Proposal
To: anoo <anoo@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, uri.trichter@nuvoton.com, 
 yoel.hayon@nuvoton.com, eyal.cohen@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Jan 2018 10:44:35 -0000

Hi Anoo and all,

Regarding "The encrypted hash (digital signature) and corresponding
public key would be added to the firmware image":
If both the decrypted signature and the public key are in flash, if
flash was replaced (by hacking or physicaly) a malicious public key
can be used with a  signature that was decrypted by the paired
malicious private key of the stored public key.

To overcome that the public key should be stored in OTP.
We use this method on our Nuvoton Poleg BMC.

Does this sound reasonable?

Regards,
Avi


On Thu, Jan 25, 2018 at 11:15 PM, anoo <anoo@linux.vnet.ibm.com> wrote:
> Hi all,
>
> During the hackaton meetup, we touched on BMC image verification and signing
> and concluded that the community would like to see two verification steps,
> one prior to writing the image to flash (via digital signature
> verification), and another one by checking FIT in U-Boot prior to booting
> from the new image.
>
> The proposal would be to implement the digital signature verification first.
>
> At a high level, during the build:
> * A SHA-256 hash would be calculated over tbd files that make up the
> firmware image.
> * The hash would be signed by a private key that's part of the repository
> (community key). Companies could overwrite it with their own private key
> when building production images.
> * The encrypted hash (digital signature) and corresponding public key would
> be added to the firmware image.
> * Yocto may already provide a way to sign images and generate keys.
>
> On the BMC:
> * The hash would be calculated on the image files that were uploaded to the
> BMC.
> * The signature would be decrypted using an existing public key on the BMC
> (this validates the new public key delivered with the image is also valid).
> * Accept image if both values are the same.
>
> Any thoughts or comments?
>
