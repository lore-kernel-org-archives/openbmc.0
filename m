Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::134; helo=mail-it1-x134.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="s9Dmioff"; 
 dkim-atps=neutral
Received: from mail-it1-x134.google.com (mail-it1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44SS0l5ykYzDqKT
 for <openbmc@lists.ozlabs.org>; Mon, 25 Mar 2019 19:21:58 +1100 (AEDT)
Received: by mail-it1-x134.google.com with SMTP id l4so6575826ite.1
 for <openbmc@lists.ozlabs.org>; Mon, 25 Mar 2019 01:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=vgGl87P/sqNer9f1dVkOnqtIHUfnC6TIVzAuAr/kn7Q=;
 b=s9DmioffIU5p/geJY4T8PViCkiAcRWXMeozgecD7pqv/KpdjSH6H2TQRvqfihMdTq9
 N/zcbZjc1Ml3gGEpiR9TZLkh4XpKyApjrvXQKeThaN32H0XTzWu4mLtCxfgOuSVNf6Uy
 bvyEUx7hWz3XlrSd3ILWRkxmd5Gx5SmbZYgsh+Y1P0qFit6MO7aZNiA1TN5lW6Xz6NWx
 ZZONRtsn/K2WIvCRvuJOeoWu5gclKy4B9trYCknCK//RQsHuq/w52hZShGJ5jHHq3Zfj
 Dts0h3Fvrt2iUn4fAbS3V/annQEZBSL0wH2Go584sokVijivkdwzucdhZXcrTX3ZWpds
 DB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=vgGl87P/sqNer9f1dVkOnqtIHUfnC6TIVzAuAr/kn7Q=;
 b=cRhGFJd1HzSDQHWeARJruTkX2hqUqsc9iBXGXrurzuYiJQTLcHpg2kNg3rzc21PRHQ
 VXuyCa3wkIi0xKdVQ5fbSx0ZCHe4ZhU92bMMLbETMpefRJ+3ahvQ5dwSfo/MUXDzWubn
 GXzKLcJwU3chmePtXs+CgcPNkWOnqVCCVLFLBq7TyLvMitEz4E4hTA9i3ntbPDl6K7yw
 fGn6ggha7hBmOv6yvWtBztcilLoh0RU70kkYDbb1srSDxpTk15mJAwTjIroxyf17yika
 SCLOsQz4DKOQ4g5jAfUti1JawGhl2+sWLHcmba6WC44k/GXcpfZteCIYY0Z1WsQlDgQ+
 2DRA==
X-Gm-Message-State: APjAAAWHZqXJQbENhE2xyp4wB5/WJzFGXk9XAAyAlTrsvRGbNznYzsoW
 ZVlaE9MEart+FIbJfNClzFmeg/thdZsSoxFiHrI=
X-Google-Smtp-Source: APXvYqzzbeAYWViUND68cLeOqc2zdTCFdcCubN+zmMXk10hdlxag+iYVYR3E7lt4GuGJD707Qq3rWbF94JSYNZvmxgk=
X-Received: by 2002:a24:df87:: with SMTP id r129mr9952503itg.178.1553502114691; 
 Mon, 25 Mar 2019 01:21:54 -0700 (PDT)
MIME-Version: 1.0
From: Lei YU <mine260309@gmail.com>
Date: Mon, 25 Mar 2019 16:21:42 +0800
Message-ID: <CAARXrtmNL+Px7vk4mA++yzO22nUWqmBnL3hn6oedB8d9516pvg@mail.gmail.com>
Subject: Userspace matching of hwmon devices to hardware
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Guenter Roeck <linux@roeck-us.net>
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
X-List-Received-Date: Mon, 25 Mar 2019 08:22:00 -0000

This email is to ask/discuss if there is a stable path/name (or whatever) for
hwmon devices in the different versions of kernels.

In OpenBMC, the service phosphor-hwmon reads the sensors' value and expose to
DBus, depending on a configure file that matches the device tree path.

The service is started by udev rule, called with the DEVPATH and OF_FULLNAME,
so it knows where to find the configure file depending on DEVPATH or
OF_FULLNAME.

E.g. on Romulus BMC, the w83773 sensor has OF_FULLNAME at
   /ahb/apb/i2c@1e78a000/i2c-bus@440/w83773g@4c,
and the service knows the config is matched from path
   /etc/default/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@440/w83773g@4c.conf

However, the DEVPATH or OF_FULLNAME is not stable in different kernels:
* In 4.1x kernel, the path is as above.
* In 5.0 kernel, "i2c@1e78a000" is changed to "bus@1e78a000" in the path.

This breaks the userspace's phosphor-hwmon.
If we fix the issue by updating the configure files' path in userspace, it
means the userspace only with the new 5.x kernel.

So the question here is, it there a stable way for userspace to match a hwmon
device?

Thanks!

--
BRs,
Lei YU
