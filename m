Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sv2PQ5b7szDsrc
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 16:25:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=jYhJKj7I; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id 10so104458ual.3
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 22:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=CSQNTK+cdqNkJYR5gO/aU9GZpythupQYdIOjuf8Mofc=;
 b=jYhJKj7IOHD/Pxepa4Hiht//CbJVf/xUVQpZw2b54qaROhFZlZ+kUVxY3ULSi8SR2y
 t1ozmt1gO0FMrmULn9UjtBs91u9JvcMwWmiqPidrTsVzYIokmtq8f8aHnX+pE+1mhW49
 0GFW50HExpznjyyuzcHeKLEZ8TB00uplpFXtwZGlix37nytjfKs295wCpUpEaMgGwHYJ
 PUV7roTah1pLXBFOjMkVFxLR0kGBFRjDZQeY9diTbrkLwrKM/CojlIa2b/oc684z3XSA
 Rka36XsKjlEZOTM6LRC7PG2MPX77Lkwl1rgqjEpK8iCD7rWv7JsPpXC0PkeBIGVKoQbE
 /98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=CSQNTK+cdqNkJYR5gO/aU9GZpythupQYdIOjuf8Mofc=;
 b=UrJG/fAHJtz+mfLwCjbHem9LbmsrRm6aZRQ2bomjbh0CmDjQ45RE5NGOMN/e4fFd4b
 GzvpoZhEhgd2dnb2itnNJKHOAlB5TEaqZljfmtdtvW6Ke/moJsVRgOwkf1iwyKMJ+ojO
 eaactM3a9xkKa2SuLVFV4yTyrrlWGtJwhlnAr71S3ZOnBmUWEkfpaVd90aPAPP9LonGh
 Rj13k4fA5ZQ3bYqQIYJenndofxHCuvIQc0EqEWlJtx4mXI+SXy29aMXTpKXs0XC0hahB
 JovvcrlsHD/xpG/i6VGxSbVYfDuc2hJcDfnHlzpPl8K6VGfRntyb0TkbGLWMYJIYnrvX
 25LQ==
X-Gm-Message-State: AA6/9RnGUBR/sZPSlT545nFYjgiXgqWldW3PyH6c6E7uNhTthgUpF0eGtf4VPmReVPPOXSIeFzzItgqA2pDM9Q==
X-Received: by 10.176.1.105 with SMTP id 96mr337435uak.31.1476249912246; Tue,
 11 Oct 2016 22:25:12 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Tue, 11 Oct 2016 22:24:51 -0700 (PDT)
In-Reply-To: <1476222134-14396-1-git-send-email-eajames.ibm@gmail.com>
References: <1476222134-14396-1-git-send-email-eajames.ibm@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Oct 2016 16:24:51 +1100
X-Google-Sender-Auth: 1qNvVS7OlIlP0EUOs5ALYsvmKvM
Message-ID: <CACPK8XeBbw0vxK93gK-=P8br5gc4a7afp9TYeQUNQD4dxYxKhw@mail.gmail.com>
Subject: Re: [RFC linux v2 0/2] drivers/hwmon: OCC hwmon driver restructuring
To: eajames.ibm@gmail.com, "Edward A. James" <eajames@us.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>, 
 Christopher Bostic <cbostic@us.ibm.com>
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
X-List-Received-Date: Wed, 12 Oct 2016 05:25:15 -0000

Hey,

On Wed, Oct 12, 2016 at 8:42 AM,  <eajames.ibm@gmail.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> This patchset is provided to refactor the Power8 OCC hwmon driver. There are a
> number of issues with the existing driver. Firstly, i2c access was embedded
> throughout the driver. Secondly, there is no way to easily add different
> versions of the OCC.
>
> This patchset addresses the first issue by abstracting the bus transfer
> protocol into a modular structure. In this way, any low level transfer method
> may be easily implemented.

Cool. I think you should consider sending these patches as a series
that introduce the driver from scratch. You can achieve this by
reverting the patch that adds the code Yi wrote, and adding your
cleaned up version as a series of small patches.

This will be one of our first client drivers for Jeremy and Chris' fsi
bus. I recommend taking a read of the current state of the client
driver API, and keeping that in mind when you write the i2c version.

Cheers,

Joel


>
> The second issue is addressed by separating the "version specific" code for the
> OCC and the common hwmon code. This task is not yet complete, but the general
> structure is in place. Ultimately, different OCC versions could be probed up
> using the device tree.
>
> Patch 1: "drivers/hwmon: Move OCC driver to occ directory"
> - Move the existing OCC hwmon driver to it's own directory.
> - Edit makefiles and Kconfig accordingly to preserve the build.
>
> Patch 2: "drivers/hwmon: Isolate bus transfer protocol"
> - Copy i2c related code into occ_i2c.c and simplify.
> - Copy common platform code into occ.c; more functions can be placed here
>   later.
> - Change core functions to accept OCC driver data parameter instead of
>   device pointer.
>
> Edward A. James (2):
>   drivers/hwmon: Move OCC driver to occ directory
>   drivers/hwmon: Isolate bus transfer protocol
>
>  drivers/hwmon/Kconfig          |   13 +-
>  drivers/hwmon/Makefile         |    2 +-
>  drivers/hwmon/occ/Kconfig      |   15 +
>  drivers/hwmon/occ/Makefile     |    1 +
>  drivers/hwmon/occ/occ.c        |  127 ++++
>  drivers/hwmon/occ/occ.h        |   47 ++
>  drivers/hwmon/occ/occ_i2c.c    |  150 +++++
>  drivers/hwmon/occ/power8_occ.c | 1055 +++++++++++++++++++++++++++++++++
>  drivers/hwmon/occ/power8_occ.h |   25 +
>  drivers/hwmon/power8_occ_i2c.c | 1254 ----------------------------------------
>  10 files changed, 1422 insertions(+), 1267 deletions(-)
>  create mode 100644 drivers/hwmon/occ/Kconfig
>  create mode 100644 drivers/hwmon/occ/Makefile
>  create mode 100644 drivers/hwmon/occ/occ.c
>  create mode 100644 drivers/hwmon/occ/occ.h
>  create mode 100644 drivers/hwmon/occ/occ_i2c.c
>  create mode 100644 drivers/hwmon/occ/power8_occ.c
>  create mode 100644 drivers/hwmon/occ/power8_occ.h
>  delete mode 100644 drivers/hwmon/power8_occ_i2c.c
>
> --
> 1.9.1
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
