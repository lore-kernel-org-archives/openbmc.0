Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::134; helo=mail-it1-x134.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="I2Wemj9Z"; 
 dkim-atps=neutral
Received: from mail-it1-x134.google.com (mail-it1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4493jk2W47zDqLW
 for <openbmc@lists.ozlabs.org>; Thu, 28 Feb 2019 18:15:37 +1100 (AEDT)
Received: by mail-it1-x134.google.com with SMTP id 188so14223217itb.0
 for <openbmc@lists.ozlabs.org>; Wed, 27 Feb 2019 23:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ox9vCoMJQjhEqI9XwISd3orH8oijeBIqkodUB28iM3A=;
 b=I2Wemj9Z7a/K3ijWALFHiWPf4EX9vb4FtFKR7So/jGccl0WIayGAuNuvdZwjx1GP39
 UxY1UkDWw9lKJP5vN41fh/kFCJVaZ+NtNdFZyrOSwou3hsBCNZRor4v2esie0JUfIonO
 wibHh2KXo3I59V4uTspB5SPRy66aScbYa3e3G2What5X2CifqjBnn83mS5a4FCw6CtpA
 uyfNKi3PVZ33B0XDLFcZgJ/TiueWnEYK8uODuMsXIcYyrw3L12AeEBmyXPCvDRXNWEmL
 y2ezx6+RJVYCbODElQuhmkDSXwqfoRWpoicDBL/gtHtNpTsX3Phn9iTVi5HpdV8IM5Ft
 ++Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ox9vCoMJQjhEqI9XwISd3orH8oijeBIqkodUB28iM3A=;
 b=iGwOeYYPdM+vHXC1xgLU/Bykofn19SbXuwvLitB6ZtylkL/VxrKxjRaHSxSgaaPFcl
 bO05UjoSBgLj4wAgOr9+jy5TMdRilW8i5Icq9JCYGArphNv4WgSGjShrFQZmCV2nyG5Y
 rwEkIDXeDKbogCGEJBhBT42JuHFOm7N0Tt+Gm5H/gkPuHtfnHNjvlswUCyHrkqn6S2tN
 IsLzEJEmeAYGzD+WlszuCrQuJvm45UKuxcKDwTaohgksGWxsES6CJX3EbZ089GizeNBU
 xs4MwAAHW5o0rfEDvIVdfj0CJBXGhi/bgRLxWG05s2lJOO25JkxaiTAj9cJNgw7pyVyh
 XNaw==
X-Gm-Message-State: AHQUAubSUkgRDOjcgAEahTtU/LhsW7fJWRAay7b7qK8Dv994c6oQe6lK
 8B9bY8GSOQKp50Kyri0FZieXbAoY1ZaUYLuh4oN5GA2zAVk=
X-Google-Smtp-Source: APXvYqw+SWaX+yApsQ4HcME9GSTO4I46hIXSzCbSWgpfYnQq4iU1QCICDdDx5h5OhMlzBR5CHBcdOOKGXS5aPxloCuM=
X-Received: by 2002:a24:5f52:: with SMTP id r79mr2172972itb.125.1551338134319; 
 Wed, 27 Feb 2019 23:15:34 -0800 (PST)
MIME-Version: 1.0
From: Lei YU <mine260309@gmail.com>
Date: Thu, 28 Feb 2019 15:15:17 +0800
Message-ID: <CAARXrtmaOQJ9a224iosU1m+5FSryC4TM7qgBT3n9MYPWzZiQrQ@mail.gmail.com>
Subject: Static layout PNOR support in openpower-pnor-code-mgmt
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Alexander Amelkin <a.amelkin@yadro.com>
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
X-List-Received-Date: Thu, 28 Feb 2019 07:15:39 -0000

As a follow up of [VPNOR discussion][1], the static layout PNOR
support in openpower-pnor-code-mgmt is implemented and pushed to gerrit
starting from https://gerrit.openbmc-project.xyz/#/c/openbmc/openpower-pnor-code-mgmt/+/18747/

Code reviews and tests are welcome.

To test the feature:
1. Pick the above gerrit commits and build with --disable-ubifs_layout
2. Generate pnor in static.tar.gz format, by below command:
    ./generate-squashfs <xxx.pnor>   # xxx.pnor.static.tar.gz will be generated
   This tar.gz will be used to do the code update.
3. Do code update, gard reset, factory reset the same as VPNOR, described in
   [host-code-update.md][2] and [REST-cheatsheet.md][3]

I only tested it on Romulus, and will test it on Palmetto. Hopefully it will
be tested on other OpenPOWER machines before the patches are merged.

Note: image verification feature is not implemented yet.

[1]: https://lists.ozlabs.org/pipermail/openbmc/2019-February/015104.html
[2]: https://github.com/openbmc/docs/blob/master/code-update/host-code-update.md
[3]: https://github.com/openbmc/docs/blob/master/REST-cheatsheet.md
