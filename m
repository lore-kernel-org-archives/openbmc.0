Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::134; helo=mail-it1-x134.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AiBZXx1N"; 
 dkim-atps=neutral
Received: from mail-it1-x134.google.com (mail-it1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dwt42zHyzDqWt
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 14:33:48 +1100 (AEDT)
Received: by mail-it1-x134.google.com with SMTP id z7so3061000iti.0
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 19:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FAHkZfup1dA1n0Uuiabh71rFKg/JfNWysl7WaPHwzTA=;
 b=AiBZXx1NzFDj9alp8zKqb7HefA/QhQPhUrOexyt1trxFxAF+A2OuQx26LsIL++bKvu
 /XIctBqHAHSkDzXf+2hMg6RhhH22iZyFzKydAe+PDwW1yk28awesMtOO7dNso49htnGT
 ugZv+GZAB/HVKoC3a2dtwuo6/hXD0r7zWxJamijVTd2ql6Xn/fVyL1g8DhiObc6bmJnc
 qjx4ysdVbFCxUZYq4yewfL81mhR+t0f/YolLSztYuqu9ScV15TEiBKQAqSItaZ0JxgEV
 Uljlb/Tb4jCxTmBFbST1eMS+LLgvbpII2Do3D7dH6unAsSnHp3VDnvAPGH4e6OADPV64
 ++qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FAHkZfup1dA1n0Uuiabh71rFKg/JfNWysl7WaPHwzTA=;
 b=C2Vfzy/wmVbVzUjfJf9jJU5ydiXntDWzDn/h6t4Vm6YgFdmYLrHnSxFynq0p9bqs21
 iAhL+SaKYJoINgwQWaPJvkDdWtinly9rGRqciJxAjluKIent6tIaXex7nOeyZQ012FQW
 L0cLnptcsi0SezGAsUVXJNXTg4dFQeZq+3G9qooRPMVkCwXlhc0pLl8fNJQBBTS0hZUn
 57YMxO1lpCeEc7Y+Vnw8FRG8V0RkeRsZ+SG+8zWhwzkpXJXXs4fOvCNlBny58pu9jKII
 wYBLmaYtcq8263Nw1dyH4kajUSspGHGXJz66Lg5K94uj1d1mjSwhl8X1UVhvXZ3Inzp8
 NIVw==
X-Gm-Message-State: AJcUukeEKswosNLQGX+92keIXJvJVZjcOb3XdcHJI54auQrO2ofQS9yq
 2g5aSIWSRmq5ztIxr6+bvgDy0saeGl1T6pr/bwQ=
X-Google-Smtp-Source: ALg8bN5hsVHoxKGR+EdodaTW/4i0lRb+XpmpFN6CjAkxbbk/NGF7Pkn+DyOYpGKe/vt5wvvnoYfAOoJSZjzA7Qdaong=
X-Received: by 2002:a24:80cc:: with SMTP id g195mr1374497itd.178.1547523226054; 
 Mon, 14 Jan 2019 19:33:46 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notzYAiR1nZ08=N-oi2g--XgjZ576wRomDDLYEdhLnw2pnQ@mail.gmail.com>
In-Reply-To: <CAO=notzYAiR1nZ08=N-oi2g--XgjZ576wRomDDLYEdhLnw2pnQ@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 15 Jan 2019 11:33:33 +0800
Message-ID: <CAARXrtkYwRP63pU3o+Bn_r_NZ9K2fAQr3O-3UPZqRY7KYaL6cg@mail.gmail.com>
Subject: Re: phosphor-hwmon funcitonal interface
To: Patrick Venture <venture@google.com>
Cc: Matthew Barth <msbarth@linux.ibm.com>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 15 Jan 2019 03:33:49 -0000

> Thoughts?  (IIRC< I've mentioned this idea before, but now i'm setting
> up some cycles to hammer it out, as I continue to implement unit-tests
> in phosphor-hwmon)

I second this proposal.

Be noted that this "functional" property on sensor is not the same one on
inventory, and from my understanding, this functional property is not being
used by other services (yet), it's just used to check if hwmon should read the
value for the sensor or not.

So we could re-use this property to indicate if a sensor is functional or not,
especially useful for fans that will get reading error when it's turned off,
e.g. the fans using Aspeed fan/pwm driver.

@Matt What's your idea?
