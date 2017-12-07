Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::22b; helo=mail-lf0-x22b.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mQEtQDBU"; 
 dkim-atps=neutral
Received: from mail-lf0-x22b.google.com (mail-lf0-x22b.google.com
 [IPv6:2a00:1450:4010:c07::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yssYZ6QvLzDsM2
 for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2017 21:44:34 +1100 (AEDT)
Received: by mail-lf0-x22b.google.com with SMTP id 94so7604764lfy.10
 for <openbmc@lists.ozlabs.org>; Thu, 07 Dec 2017 02:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=olDmFX4jNnWgco12fsBcKWCHJXl7hO1W956uXxsycRo=;
 b=mQEtQDBUqE2PJFFQUSQA3jCRfN/OLK61mdjuXzSmfyRCmjK+o3HlUY0YKEx460J0xq
 gLn3qZBmk5cqiUuR1Xyot0L9yviNhwHr/j6wTgulaL0oYXhlMxiAN4hBYoyOenofmyqG
 yN6LX50j/ogCQU8MiO3UJhQZnPNaloAleZdSw2oNQLDe4tKHvM+Y8c/skk482m8LrW/l
 dCo5J6fYIKT8uiPg400OXGL1W0WoTBFKwfuAVxGxfgl6AgsaJgwxmg6Zh6YCNe1IfT4f
 bcRRT5V0xPFlzGG9CjsSynr+Krhw9p1HqXoH4wTdBd0ZgftQKpIa4O2qG0BlIGXF6nPH
 J/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=olDmFX4jNnWgco12fsBcKWCHJXl7hO1W956uXxsycRo=;
 b=S06dR5xsLOe3zRH63vflOeltNdgNl5HpxghG1Z3Ct89uv+B9gwxmsqn/rIe8Xw7jlU
 2LgwebUNHpcGlR+dOqFTBD0wMyN3MimQ8/Ps2qKIJy3jKBqch8yHHeR/bhFnAePJPeeg
 MYAXhLfySoPhye40oq3u+Yy1ipPWywjUwIiTrzuGoJC5+7teE5Fk95EDXtsNZPYKPYDZ
 /CDXm7pfFhM+2rpsyXUTwl2bkzDme6XKiqoywUYcIxusnq9Tihqx3R/G6zB+l0HFhvzb
 XUVoEXkD5pSSbuQXqnqdq9zqWLn1x+VoV5sMVmYb8Llb2Cksx61/g8jcbExNVwRlJWvj
 Strg==
X-Gm-Message-State: AJaThX4D47yMpUMHkYTrmZVxT7b+xlDQXjSFJKsH3ZYBVLB0nDOMQB22
 QPvftMPWJcBvref1CBVjb6gbG+bXLEbh565NG1A=
X-Google-Smtp-Source: AGs4zMa2KWvGUJs7u0tQ+s4OfKke877bFAGmNKwXefokv6Hp9YDpXvk8V/TlHrl8w0+vprmaP1F1jaPe7Ea10Wopo6E=
X-Received: by 10.25.81.133 with SMTP id g5mr11860520lfl.77.1512643470997;
 Thu, 07 Dec 2017 02:44:30 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Thu, 7 Dec 2017 02:44:10 -0800 (PST)
In-Reply-To: <OF02E339DA.55131D65-ON002581C5.004272DC-002581D4.0041FCDE@notes.na.collabserv.com>
References: <OF02E339DA.55131D65-ON002581C5.004272DC-002581D4.0041FCDE@notes.na.collabserv.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 7 Dec 2017 21:14:10 +1030
X-Google-Sender-Auth: C8yrqVSPUd8RcxpwFSOAx7qXDow
Message-ID: <CACPK8XdB6LWJ6TLx5Jdjojpbwnh35a7GHwX5ieh1PAFFCCn+Eg@mail.gmail.com>
Subject: Re: fsp2 patches from upstream to openbmc/linux
To: Ivan Mikhaylov1 <ivan@de.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Karlo Petri <XXPETRI@de.ibm.com>, Bradley W Bishop <bradleyb@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Dec 2017 10:44:36 -0000

On Fri, Nov 10, 2017 at 10:30 PM, Ivan Mikhaylov1 <ivan@de.ibm.com> wrote:
> hello all,
> sorry for first note not in plain format.
>
> these patches are already in v4.13 tag in upstream kernel which are needed for base support :
> c4b56b023daa91953e9ebe91143e6ca156f0bcb7
> 9eec6cb142bddd35268c7c59b6c81be6c091aaf9
> 20975a0ae1ccc59a21a149e2fd2964ce88edb0a9
> 6e2f03e292ef46eed2b31b0a344a91d514f9cd81
>
> these two related to mmc setup and not in v4.13 tag, I've cherry-picked them into v4.13 - no errors,
> no problems with compilation.
> 754f030908c3615781e9e3559d8ba1500cf82215
> 2feada5bb0441c918d12778bf9449d5ff805aa7c
>
> so we need them into openbmc/linux if possible. thanks!
> if you need anything else, you can ask us about it.

I suggest using the 4.13 tree for your platform. I've cherry picked
the two commits you required into dev-4.13.

Cheers,

Joel
