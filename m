Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x22c.google.com (mail-pf0-x22c.google.com
 [IPv6:2607:f8b0:400e:c00::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t2vXJ6wzTzDvhN
 for <openbmc@lists.ozlabs.org>; Tue, 25 Oct 2016 11:43:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=FWtoAtvt; 
 dkim-atps=neutral
Received: by mail-pf0-x22c.google.com with SMTP id s8so107836443pfj.2
 for <openbmc@lists.ozlabs.org>; Mon, 24 Oct 2016 17:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WAVxLaOB0ncwAi/k11DPGcuFFyawCE/1h1Wa2+mQMDw=;
 b=FWtoAtvtOHV2jsKzal9P/QPdamA9Ux1YhRclTYMPjvftqU2/UidB1pK/yU5JLxfsni
 g8naTG4K0s8Uw6gBv+EQUghKwzL6w4ODEY8GU/hoRwOoICKgPWFQ+Yy2EQb0YfwcWIL/
 /mAgqwR2A8eYAPLW+cMVIcxMT4NuR3X8EYmgSBhLSwhBZ4Awnx2HTbAqlaoy49aho6UE
 m1e4ZEL9eNz9gdiayErh8yKAc3kccpjaK5zmasp6FuliFsr3EjexsoZJWJYCunzW4ETK
 ZsMHmSOxAkbtL378aR3hDnt36cbrgDwX1SPHcJIC/beSxTIn33rYNo68VAebtbAKdF17
 J00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WAVxLaOB0ncwAi/k11DPGcuFFyawCE/1h1Wa2+mQMDw=;
 b=a70nrddZC7q3hLJj4zpw1jSN7hrCVYv475xxIRlKTn/TSoQ/VRx0RgxFVAx9GYvSrY
 ruARSUawAcYH5cvbVu8Uk6RS9rlc2cG179uE/oHqI1J8VsWV4CVR46kygxugnxX34Gvj
 44JUAnjOdvchqOZh57lI+HuANaPpoF5RDpaKyfx74toKOeqmpenPSkaHxTnRhiizs5wO
 bvxcZkGVqrLA9RJ7RKMDIGDNykOr4IGm2QTxTPV2jlDvOZgLlquvhyi1CYVSqSLOPUz7
 9n2ZNhdIj8OR3l26AlfgKwalLhkd3KDsXkWUvMma5+LnSsPB1vl9dJQJFcGLhCkOSrtS
 oAlg==
X-Gm-Message-State: ABUngvduWfaHiC7/aZ5fXxIs62OpT2Gi4KihuDcT0Mhgl6G3Wj3KcxrcagUZmJpVTmpGyS6+
X-Received: by 10.99.140.94 with SMTP id q30mr4007826pgn.112.1477356206032;
 Mon, 24 Oct 2016 17:43:26 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id m25sm27987088pfg.14.2016.10.24.17.43.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 24 Oct 2016 17:43:25 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: patrick@stwcx.xyz, raltherr@google.com, openbmc@lists.ozlabs.org,
 anoo@linux.vnet.ibm.com
Cc: Brendan Higgins <brendanhiggins@google.com>
Subject: Logging utilities.
Date: Mon, 24 Oct 2016 17:43:22 -0700
Message-Id: <1477356202-10960-1-git-send-email-brendanhiggins@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <CAPLgG=nnxBf882unObKXWJrPrPK=bJOhNK7_4X=Gw1vJsjAr-w@mail.gmail.com>
References: <CAPLgG=nnxBf882unObKXWJrPrPK=bJOhNK7_4X=Gw1vJsjAr-w@mail.gmail.com>
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
X-List-Received-Date: Tue, 25 Oct 2016 00:43:30 -0000

Trying to revive this thread: we never concluded discussion on this. For the
convenience of the reader I have quoted the previous email below:

> Thank you for the background.  That explains a lot about the path Adriana
> has gone down.  I completely understand wanting to separate policy from
> reporting of device and process errors.  Where we differ is that I don't
> see that as the purpose of logging.  You've described an event-based
> telemetry system meant to be primarily consumed by other software to drive
> alerts and automated responses.  I view logging as being primarily for the
> benefit of a programmer or operator trying to understand what section of
> _code_ went wrong.  That distinction is part of why glog isn't designed to
> be super high-performance.  Google uses entirely separate systems for
> telemetry.  In my and Google's experience, scraping logs to extract
> information (even when the messages are well structured) winds up being
> painful to maintain and unreliable over time even when using journald.

We have a patch set out that adds glog support at:
https://gerrit.openbmc-project.xyz/#/c/788/

In addition, we have a patch for glog that adds support for logging to journald,
but I would like to get some feedback before I do anything else.
