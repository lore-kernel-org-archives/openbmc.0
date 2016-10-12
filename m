Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x243.google.com (mail-vk0-x243.google.com
 [IPv6:2607:f8b0:400c:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sv2KW0XqBzDsrc
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 16:21:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Q2h/YoPl; 
 dkim-atps=neutral
Received: by mail-vk0-x243.google.com with SMTP id 2so1901885vkb.1
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 22:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ZL3GOb6HbsJ3uOA+a9MljBlmp5x6XgTyx2AO4j6hFw8=;
 b=Q2h/YoPliIMklHlKh6jBK1rYLLD2144qPYm9+Ap/l7pxBVmFZSdeawQll7F4oe0kqY
 ucHXuMF9Dn7FbWh3pXUL73IfKgL66hvMc/1HHp0ES8hZ25S+UsvVW2OotCDP8s2+H3kd
 7dsmeTP5qKlcjr3j0mM4MbywqoA3uTwPPADvtPhlgp83kmZ1n1Z3W5ZaY/0zy5E+fNuM
 mumHv0p3W3KhaC3M1i3G4RNi0fXgWl9/cKi2QtQuYQ1/RrUerNFJGrJ45jhXihDbv2or
 YgFerc501YKAOGo5m+jCzYIpqm6sbp5MBieSU44mycGpWGuLHJQv/E7BlWZ062nFvNQ6
 1R1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ZL3GOb6HbsJ3uOA+a9MljBlmp5x6XgTyx2AO4j6hFw8=;
 b=D2ag7heBEwznf+CoM+L1hvqRQ7diXkKHCgqvIuWN1rm5JHgkCPdDQf7j3yQfCVYwZ5
 Wj2jKt7icDQ+ZMhqgObBtrSzrK7F/JMBqE2goM8uAY8/aRvm8Cpn5k551MPcAzuOfTb4
 GNKkZFsS0sHKsUZY/5F7yXfcd16TqeoIPEhPgFfoO/K8PhNDvKo0gIcAL79cp/QIDy8c
 RpQB5y5Z4d9JG+PeVOf+xs3LA6YAjRDzl8hr1Cc+EH856Qo9Evq0TUG5Ah8WC4ckveo2
 JIxV3H5mG/XObeCtQIj9kMcQCzE33C78H9FISy0M8CJaG/KGQOc6F9gtEMfUGVKz4XmN
 p7Cw==
X-Gm-Message-State: AA6/9RkB8NVpiPNiUMksAZW+DekpFU9MfC6IlqIV8ttYEjniLG1HrSjTvdVtzuLY6wMVS2rrhRj+NxX4iaVbFw==
X-Received: by 10.31.140.147 with SMTP id o141mr4865639vkd.149.1476249708661; 
 Tue, 11 Oct 2016 22:21:48 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Tue, 11 Oct 2016 22:21:28 -0700 (PDT)
In-Reply-To: <1476222162-14541-1-git-send-email-eajames.ibm@gmail.com>
References: <1476222162-14541-1-git-send-email-eajames.ibm@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Oct 2016 16:21:28 +1100
X-Google-Sender-Auth: U8WYfTVc21GP1oEGCookkJmjJDM
Message-ID: <CACPK8XeKoiSn3DBz=j=Ki5Se315NupZR1EkpDcPfyKf8ZVOrYg@mail.gmail.com>
Subject: Re: [RFC linux v2 2/2] drivers/hwmon: Isolate bus transfer protocol
To: eajames.ibm@gmail.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>
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
X-List-Received-Date: Wed, 12 Oct 2016 05:21:51 -0000

Hey Eddie,

On Wed, Oct 12, 2016 at 8:42 AM,  <eajames.ibm@gmail.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> - Copy i2c related code into occ_i2c.c and simplify.
> - Copy common platform code into occ.c; more functions can be placed here
>   later.
> - Change core functions to accept OCC driver data parameter instead of
>   device pointer.

As a general rule, if you find yourself writing a series of bullet
points in a commit message, then that commit should be split up into
one patch for each bullet point. This list is a good example of such a
case.

I had a brief read of the patch, and I noticed many of the comments
are descriptions of what some very straightforward code is doing. I
think you can drop the comments in this case; consider adding another
patch that removes such comments.

Cheers,

Joel

> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  drivers/hwmon/occ/Makefile     |   2 +-
>  drivers/hwmon/occ/occ.c        | 127 +++++++++++++++
>  drivers/hwmon/occ/occ.h        |  47 ++++++
>  drivers/hwmon/occ/occ_i2c.c    | 150 ++++++++++++++++++
>  drivers/hwmon/occ/power8_occ.c | 343 +++++++++--------------------------------
>  drivers/hwmon/occ/power8_occ.h |  25 +++
>  6 files changed, 422 insertions(+), 272 deletions(-)
>  create mode 100644 drivers/hwmon/occ/occ.c
>  create mode 100644 drivers/hwmon/occ/occ.h
>  create mode 100644 drivers/hwmon/occ/occ_i2c.c
>  create mode 100644 drivers/hwmon/occ/power8_occ.h
>
