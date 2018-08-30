Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="n8sIWKEk"; 
 dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 421YpS35kbzF37N
 for <openbmc@lists.ozlabs.org>; Fri, 31 Aug 2018 06:23:11 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id r1-v6so4376945pgp.11
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 13:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=9UwThoAO7G7/Q5GTkC9mDQjMwZ7SUZBd2bFydkG19wE=;
 b=n8sIWKEkHBJvHETAcyJEtFYWpBsilaQ1lp9kg8osT2xTZEJFbFjGuUZhp1QJRQiPgJ
 //DdS1SK593eM2/pRPs3J4R4ZlSILVkI/7h0isOT6JFBWevmpnPE6BHuPpCjKv5nAfdY
 lPqgEzlz0zcYRV07eSgitdZvFaMqEn7ksQpBD93aef4Gf/bXTQL3aXbyDVOOel36kQxp
 bi/gk6Myf64tuOWpkPiD8OiGhFknVf+UOKwPP5QsiJf/P4V9PkycvrUimefhr2+MDm2D
 yTWxT5xcRSKvKfWkG+g1Wj3Hw4+fQxt7FhynTCw6usVEY/ZKn6wZF3+RvQsMNAsB7hKj
 0WWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=9UwThoAO7G7/Q5GTkC9mDQjMwZ7SUZBd2bFydkG19wE=;
 b=autpLYfeWbsRIXt9y+cL78kNypJIuw6SMBrUdqv/T9Ce6mNOJbKZF5k7D8FC8q5yQI
 Gkif1TC4bB/xRt+kB3RHGKqqmyCAm+H7etGWDsKlufgcIkA60R0kO5N/1ongeHeX/unA
 pDRo5V61liFDvPZnRolisAslWMHCuiHnaAOVMMH5wWJwDUt3jgivz43JJR+cQqk1f213
 41TIa7XSg+23UVL02C/mt+D5r0IPeAPuIlY6p9u0XBfaemenOh4WEG5wWmuQhRNUpYQz
 yzuF31WjJN2zE5ZJPCQCM96zHYhe+Ud2+uguOal0mrpIupYiOFz+o+WmDHOdGtmx2QKL
 FV5g==
X-Gm-Message-State: APzg51BIZh99RFApl0/kJDK1MTgVQ4bBe0PRTGQuZ6F0iZuoPV3tDUo/
 UeXLDOmWjfnBxSPUSao0d7DDOoTybsngiCF9crsGWQ==
X-Google-Smtp-Source: ANB0VdZhTIVCXDNjEla8kUaym02w6QcQqAZC35yB380wV0Y75KY+0o8kui9vqvsqEnvRGqwspUKmakgw18uKeDYSLDk=
X-Received: by 2002:a63:6745:: with SMTP id
 b66-v6mr11596582pgc.248.1535660588556; 
 Thu, 30 Aug 2018 13:23:08 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Thu, 30 Aug 2018 13:22:57 -0700
Message-ID: <CAO=notxSpYOv1Z8KqnHi5VhEQ-1QD7T3MMz7Km174u18tSQROQ@mail.gmail.com>
Subject: Feature request in phosphor-pid-control
To: Lei YU <mine260309@gmail.com>, "Tanous, Ed" <ed.tanous@intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2018 20:23:13 -0000

Currently we expose a zone's state, whether it's in failsafe or manual
mode.  One can read or write this information over IPMI via OEM
commands.  With the PID objects, it may also be helpful to read the
PID values over IPMI periodically (or later read/write them).

A zone has PIDs, so we can expose an interface on each PID that
exports the values onto dbus.  Obviously, values that are updated
regularly should only be updated in dbus if someone tries to read them
-- that's what I'm thinking there.  Keep it more of a report on read
interface instead of one that broadcasts for others.

I'm going to start hacking out an initial design over the next few
days and update this email thread.

Let me know if anyone is interested in this information or has already
worked it out.

Patrick
