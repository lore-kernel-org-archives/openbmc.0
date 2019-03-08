Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::133; helo=mail-it1-x133.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Sa3GFiW1"; 
 dkim-atps=neutral
Received: from mail-it1-x133.google.com (mail-it1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Frc24z1MzDqGN
 for <openbmc@lists.ozlabs.org>; Fri,  8 Mar 2019 13:12:17 +1100 (AEDT)
Received: by mail-it1-x133.google.com with SMTP id w18so18661598itj.4
 for <openbmc@lists.ozlabs.org>; Thu, 07 Mar 2019 18:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7sWxwK6UIOv/BVP0Oz3i4AMITRprTzjYTAej6FNULBg=;
 b=Sa3GFiW1ho48BVorTsZK36i+HzgWJUiNhP/jn/3sNpSeghx8gI0L4Bw4jxM++vh38t
 weL+0Y7Qe6nXXOUnlyIpGX9Q01rrZM0XoDVlrxenmvFcWisDrl44UJ9jKJa5w20hrzlw
 wmWQjIOsg/2g+fTqJ2gPyX8q1QBmZRbOCWaNZS/91R06lavyzR55ISoFWK7gwa98yz1J
 EIATjKBl2mP80ed4gTPKhqY7bfdq1/Nu/ZFsO8QIkWI9pkNbyNtNAt1yfQ5KNvubuOfu
 JgWrYLhjDW8HVYxLYFmij+EYkEudXwTQFFccL1xVC94MR8OanDk4jOKMK0a36pOMpC62
 Esbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7sWxwK6UIOv/BVP0Oz3i4AMITRprTzjYTAej6FNULBg=;
 b=aPGkktoN5IleNeye04PbROvOD4LcADLaL7Ixc1Gpaia+likYBXbeDHOdJEs4YNh62r
 MZn0MqvW8Nl3CQbxDP25AKwgGvivUaaoSjxdqyLdc4REJxZGePZkIwkIK5SJ0LOn7hTU
 3oGmufU8V9dban82A7kv4Y8qa8z0bu9u2hcmyJfMzKhVYC57t78kVXXrqReFQBbJ9Lf3
 PlhUfoii+MMo3kuKjaSwBwpuTKg/TJBYo8TB4oLIHnC4vzvvTj5L4AddNtCO96nioNaK
 d2YebE5bEyY/x4pqr4Xfj/HQ64KNz6ESgJRgHYAb5G7kaPt5fsvNqzxPKC9S6s20/rcP
 70EQ==
X-Gm-Message-State: APjAAAWzkWHmBWuwMuqUVQw6XxoMqF/FJgU7p9NZbL43eoWue1+UwfL6
 5rzGszfND7QQPxKeqPwrrGoWyooFVmJJTEeZDok=
X-Google-Smtp-Source: APXvYqwAjBhBdtAgiMwnrQR5pMwV+C4daEuCFflJAE6RsTSyHj0Afx+hxJ9ZoQ3jIW/OV44oKRZrwmziY2jsrwWs+8I=
X-Received: by 2002:a02:228f:: with SMTP id o137mr9296681jao.76.1552011134183; 
 Thu, 07 Mar 2019 18:12:14 -0800 (PST)
MIME-Version: 1.0
References: <39398601-6181-ac24-991c-528e0b0f70f2@linux.ibm.com>
 <c304d042-3b25-6e80-7722-6fe3b3946182@intel.com>
 <a3b3fb1b-b20c-2979-3872-136b8f99fd07@linux.ibm.com>
In-Reply-To: <a3b3fb1b-b20c-2979-3872-136b8f99fd07@linux.ibm.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 8 Mar 2019 10:11:56 +0800
Message-ID: <CAARXrtkXeH1y5pWd79Qzmeumow2b3N-wxAPduhu1wu+qR57zog@mail.gmail.com>
Subject: Re: PID control configuration usage
To: Matthew Barth <msbarth@linux.ibm.com>
Cc: Ed Tanous <ed.tanous@intel.com>,
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
X-List-Received-Date: Fri, 08 Mar 2019 02:12:20 -0000

> >> Could someone point me to a functional
> >> (possibly in-use) example or show the json config produced from
> >> entity-manager?
> > I thought the Quanta system used it, but I'm not seeing the JSON.
> > Patrick checked in a basic example here:
> > https://github.com/openbmc/phosphor-pid-control/blob/master/examples/fan-info.json
> > But I'm guessing you already found that.
> I did see that. I used that as my starting point, but its quite a simple
> config that I was interested in seeing a more complex example that's in use.
>

I tried pid-control on Romulus before and here is a working config for
Romulus, just for testing purpose.
https://github.com/mine260309/openbmc/blob/3d45a1b452d9150da89e058bcc544d9f5525cf27/meta-openbmc-machines/meta-openpower/meta-ibm/meta-romulus/recipes-phosphor/fans/romulus-fans-sensor-list/pid-list.yaml

The above config does below settings:
1. Set the outlet temperature set-point to 45, so when the temperature is
   above 45, the fan speed is increased, and when it's lower than 45, the fan
   peed is decreased.
2. Romulus' fan0/2 uses the same pwm, so they are controlled in a same group.
3. The fan1 uses a separated pwm, so it's in a separated group.
4. I tried to use cpu core temperature as set-point, but that requires the
   cores described in the config file are all available.
   If a core temperature is missing (e.g. the CPU does not have all the cores),
   phosphor-pid-control throws and exits.
   On my Romulus it has 4-core CPUs, so I need to put the specific 8 cores in
   the config to make it work.
