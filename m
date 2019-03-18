Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::72e; helo=mail-qk1-x72e.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="tT9n/PO7"; 
 dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44NRdy5wJmzDqJc
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 06:51:48 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id n6so10410464qkf.1
 for <openbmc@lists.ozlabs.org>; Mon, 18 Mar 2019 12:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pNRGswv1mWki5WCHuqwYbc6L4S1AZMuj2PhomiiuWLc=;
 b=tT9n/PO775pImr/W6nsmSEB5ShSO5UYfzUIZOm9SY/5w0yKYu/7h2VDyv6d5/dQ+gJ
 Rf5MLY3soGgy1Kd1A1CKBpVnGPkGW7O4TbK6WRG/vnrULVIcl7d8KaL+oLs3tfgMcsrk
 rkPtXP5lZhF7UzcucoRaQgrrC9lcQEulct2Q+7AbHeeDX7wom3tsf7zwOgdqUW+lsX/M
 Ps7eo0lULotcHYOLn5/8PWDr8HwSYzFXCJRjpLv3mpq+aP9UhRULnP47BSvQ0+z9iu1l
 ad4HJaTvcWoZcNahmVBvQEs1HFm3c2SLec2D4US1NOq4TYZ0a3H2fN6Sg3o12x7CleHQ
 HqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pNRGswv1mWki5WCHuqwYbc6L4S1AZMuj2PhomiiuWLc=;
 b=D/xvvQuUC4Zzb/UeyvnIZ4VsrYQ1UHi1ZA1CKccU3iy2wW1xlCfMjP88/iUTGARdDb
 hlgeBQD8douCS8i+vIW8UVX7+fSGZYGRI/f9BKy85zDrBmjr57WCSM5zFjCAiUL1N5qA
 oB+M5SVys53fLKIdGFEllVCfhbCYeyRMNXGGnov2ibcVU/8pNrhAr7fPWSOjGjvNO3Wn
 7pCbm5NSf86g2T9uiO0MG0P+7oAaU5YCWHB+oSGcpjC9NP4IzjquDkdPhM+zZAoT61uv
 4z4XwD3ZlDvGyItwyajwVPgISnjE/X7+gVqXs6EKqu57QOVOJrDZLh249vqONjv2Etx9
 UM8w==
X-Gm-Message-State: APjAAAV8nxxMGgefMfkCGhUfpSzMUlJDr6noc2pMjLdT1Y7HlBr3bvpT
 NI4XOBg9tGT7UjoUD3Q+LI7xSQXWym3RtprhKcD9/g==
X-Google-Smtp-Source: APXvYqxmVk6+wwuNvnDBmTO9V+jzWZx+FDCRYR9gM3jy/JC1rzIaR8Fou70kUWgX9kca00BENpUy6xjDihNoIl5aA6s=
X-Received: by 2002:a37:9805:: with SMTP id a5mr13914537qke.68.1552938703544; 
 Mon, 18 Mar 2019 12:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190318093923.2fget5dy3msm5vxd@thinkpad>
In-Reply-To: <20190318093923.2fget5dy3msm5vxd@thinkpad>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Mon, 18 Mar 2019 12:51:32 -0700
Message-ID: <CAJoAoZmaz_3=7OaWZ-wL62pf42smc4MtW9A8eu2n0K6cUUGJRg@mail.gmail.com>
Subject: Re: Pressure (altitude) sensors
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Mar 2019 19:51:53 -0000

FWIW, continuing to use the Sensor.Value dbus type will be really
valuable to making ipmi "just work". There might still need to be some
minor work to map the sensor type IDs, but it will follow the same
path as existing servers and not require much fixup.

On Mon, Mar 18, 2019 at 2:39 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> Does anyone have any experience with using pressure/altitude sensors in fan
> control algorithms?
>
> Today we have the hwmon <-> dbus bridge for temps and pwm - one idea here is to
> have an iio <-> dbus (Sensor.Value) bridge.  Are there other ideas out there?



-- 
Emily Shaffer
