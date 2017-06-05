Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x233.google.com (mail-yb0-x233.google.com
 [IPv6:2607:f8b0:4002:c09::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wh72Y2YKBzDqKp
 for <openbmc@lists.ozlabs.org>; Mon,  5 Jun 2017 18:16:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="k4RvUwfS"; 
 dkim-atps=neutral
Received: by mail-yb0-x233.google.com with SMTP id 202so31023184ybd.0
 for <openbmc@lists.ozlabs.org>; Mon, 05 Jun 2017 01:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:from:date:message-id:subject:to:cc;
 bh=ZsXx9F/csWcbyC1QsZXvD/io6ocM1fVElyQg1u/MEtU=;
 b=k4RvUwfSUJDDbCO+2iryO2Abzou1zKVMbosMdCJbYuByjzVQw8WnG6Ww0riE/tkxfZ
 LDtVpoKpYE+XEOUyRy5VjGoBc7ygEstdOKbPaQriSGXpbeoXvOPq9KUNSE/TOEauduJR
 3mDyrc5A9qJ6RA+V76OEOZ6VTE1GW2uwzQSE58723osLB/jRp3IGGdXnnurl10WeBO2m
 4J5Iq4l6KemotW0NHn1HIV+fTlxxqFh7LI5z/Mii0WgOWK0JLq+prfFxQ3yuQklePAZB
 50r+5ew6vwLldrQHec1P0T8qaOY6ta9G8CEhFFrOi8dtaoIdahbzZNIDTY8nsvdxcfR1
 anYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to:cc;
 bh=ZsXx9F/csWcbyC1QsZXvD/io6ocM1fVElyQg1u/MEtU=;
 b=YO8C5/54ZyVkwSHQW/hWhputCFPfga9oIEcRbrzcCuTs1olwiivGWWto6oy8Uu2BeT
 llYMKgCamb7iQP48zFo+x8r2toHhZS28KW+DXyYVTFnRqt+AIkR30ft61aqoLZKWqB3s
 1xHYOtaP1S3oMWaDl7g5kbRMpHg7lkvu/C1Ghgmb5UfQzflmg/JB8HFKo8nbKdSAMedC
 O4d+qwRBU9QxZj6G3V80/czcp384Hv1TRUEbBcLSwXS+8XrLAfLSTPN7FeN38uv2sMZt
 qTWcRb0FRUWH8AHD8L/hC1OxaUayQO8E+DvuKnftJmhcALVE119XBiMjebD+fffjSnsS
 Cdmw==
X-Gm-Message-State: AODbwcD+KSSBocbSQgxi9Qf26C//MR5YT7/aEgKK/E/44Evkymj/iqzA
 A1AjqyJrYeh1cTW/70HGOdBVTqnaZDL6vd+myg==
X-Received: by 10.37.172.156 with SMTP id x28mr8085338ybi.169.1496650610855;
 Mon, 05 Jun 2017 01:16:50 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.183.7 with HTTP; Mon, 5 Jun 2017 01:16:30 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 5 Jun 2017 17:46:30 +0930
X-Google-Sender-Auth: AaZmyeSe7SILOuhPezzBhJIMqRY
Message-ID: <CACPK8XewcZ51qZqQHBzn5EuPvJw+P+ue+B87v=NRKrPZSNzYYg@mail.gmail.com>
Subject: Enabling p9 OCC hwmon
To: Edward James <eajames@us.ibm.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 05 Jun 2017 08:16:54 -0000

Hi Eddie,

As of 763d6007e084f480b7129f35560c30ce30938509 the kernel tree has all
of the drivers that have been posted to the list staged, as far as I
could tell.

I was attempting to enable the OCC hwmon driver, but it is behind a
config symbol that does not exist:

$ git grep CONFIG_SENSORS_OCC_P9_SBE
drivers/hwmon/occ/Makefile:ifeq ($(CONFIG_SENSORS_OCC_P9_SBE), y)

Can you work out what has happened here?

Cheers,

Joel
