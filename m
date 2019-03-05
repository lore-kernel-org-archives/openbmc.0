Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="owJgeHMD"; 
 dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44DNB66Fg7zDqCw
 for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2019 03:48:12 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id l11so6003967pgq.10
 for <openbmc@lists.ozlabs.org>; Tue, 05 Mar 2019 08:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8P0UA9w8ZagA+EgZnzMm6F6+a82jmMZBjtFLmslj8bQ=;
 b=owJgeHMDVFAOCl4I4BspEhmnc5Gq1FTKB5d1Be9m5j2sXclwzrGbLx1Oym2i9Slei6
 +ZFMcklGJbo050Cw2u/XC84E7rrcID8LBbp4LPSR87m+P3MfpOyX3++80P+w5/OLSYdT
 0MM5xTjeGOT5G2JsOtKsWZlqwMUpJAsNs24VtJQdPaHcrFO1pJKy+3LnRCASCpB7ms9E
 X8Ql4VLSUsOAmSpgIL016aRcMSPkaSYSbP2G+3WNSVTOEFHgw/3ub5iCIwTISiTU1m0F
 mA8ksId8EP9tY7G25OBYZGLrB267KUD1ewcJ1DVPgwdULHb/O0WkVZdTq6Uf9mS2Bc0q
 l6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8P0UA9w8ZagA+EgZnzMm6F6+a82jmMZBjtFLmslj8bQ=;
 b=Ze98wm3EGQ8ytvG1vEKW95SJQy9IkumIqU6wT9GBer5KfBEsUevb3ugghP1Glg090h
 cFyXJT1uN5a1yDfRuSMr4lnTjH5X49Cc2EVn1hoYLVrQoViExdyS1s8CNseYD4l01/7W
 Gx7gHJzDl4nLH4LuYM0b4ZuiNNF6VjKVPUt7R+VnGoLhLV7PjjW1ivl94r40qov6xt86
 5DtX1PwR1XXdCs4bMw31WDm6lGUNIQtg/ynC4MHrRVlNWWS+Mtqzmig77zD+SBag0wr/
 Gmz/O+2o2xVe4CPl4j8OopV31rWqtwY69GSlfO3UtwAYaNJsDt4yOt6mMg92MCPK6j35
 aAkg==
X-Gm-Message-State: APjAAAXDrXgyqMB0fXTM0FmlAV71q2TcW89mRTGWmi5D+MBmZrC+Mnmp
 9+CtD0TqicI89qle0gb7xeq2hTknQJeGPo0HPMJ1FgEFO08LHw==
X-Google-Smtp-Source: APXvYqy/ZpTk811OhWV32EkO8HJAK3B34ASzJ91FOEgsW0fnARjDIuRTYwcY2RewLuHao6JQdvtc2eTPKP0ilx7E5D4=
X-Received: by 2002:a62:11c6:: with SMTP id 67mr2728908pfr.68.1551804488320;
 Tue, 05 Mar 2019 08:48:08 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 5 Mar 2019 08:47:57 -0800
Message-ID: <CAO=notwtEi-z1BW9T6mgTHz2uF5Y9=O=N1JpXK0sNNVyajjsGw@mail.gmail.com>
Subject: Bizarre CI Failure
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 William Kennington <wak@google.com>, 
 Andrew Geissler <geissonator@gmail.com>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 05 Mar 2019 16:48:16 -0000

https://gerrit.openbmc-project.xyz/18327 is failing:

07:17:43 /home/jenkins-op/workspace/openbmc-repository-ci/openbmc/openpower-debug-collector
> make -j 80 -l 80 -O
07:17:43 cp: cannot create regular file
'/usr/local/share/phosphor-dbus-yaml/yaml/org/open_power/Host/Boot.errors.yaml':
Permission denied
07:17:43 Makefile:1067: recipe for target
'phosphor-logging/elog-errors.hpp' failed
07:17:43 make: *** [phosphor-logging/elog-errors.hpp] Error 1
07:17:43 make: *** Waiting for unfinished jobs....
07:17:43 /usr/local/bin/sdbus++ -r . error exception-cpp
org.open_power.Host.Boot> org/open_power/Host/Boot/error.cpp
07:17:43 /usr/local/bin/sdbus++ -r . error exception-header
org.open_power.Host.Boot> org/open_power/Host/Boot/error.hpp
07:17:43 Traceback (most recent call last):
07:17:43   File
"/home/jenkins-op/workspace/openbmc-repository-ci/openbmc/unit-test.py",
line 796, in <module>
07:17:43     build_and_install(UNIT_TEST_PKG, True)
07:17:43   File
"/home/jenkins-op/workspace/openbmc-repository-ci/openbmc/unit-test.py",
line 447, in build_and_install
07:17:43     check_call_cmd(*make_parallel)
07:17:43   File
"/home/jenkins-op/workspace/openbmc-repository-ci/openbmc/unit-test.py",
line 229, in check_call_cmd
07:17:43     check_call(cmd)
07:17:43   File "/usr/lib/python2.7/subprocess.py", line 190, in check_call
07:17:43     raise CalledProcessError(retcode, cmd)
07:17:43 subprocess.CalledProcessError: Command '('make', '-j', '80',
'-l', '80', '-O')' returned non-zero exit status 2
07:17:43 Traceback (most recent call last):
07:17:43   File
"/home/jenkins-op/workspace/openbmc-repository-ci/openbmc/dbus-unit-test.py",
line 91, in <module>
07:17:43     check_call(UNIT_TEST.split(','), env=os.environ)
07:17:43   File "/usr/lib/python2.7/subprocess.py", line 190, in check_call
07:17:43     raise CalledProcessError(retcode, cmd)
07:17:43 subprocess.CalledProcessError: Command
'['/home/jenkins-op/workspace/openbmc-repository-ci/openbmc/unit-test.py',
'-w', '/home/jenkins-op/workspace/openbmc-repository-ci/openbmc',
'-p', 'openpower-debug-collector', '-b', 'master', '-v']' returned
non-zero exit status 1
07:17:44 Build step 'Execute shell' marked build as failure
07:17:44 Set build name.
07:17:44 New build name is '#25702-Patrick Venture'
07:17:47 Finished: FAILURE

It works fine when I run the CI on my local system (using the same
scripts).  I even purged all my docker images this morning and re-ran
it.  Wow, that takes a while to build up, but then it was still fine.
Any thoughts?  My immediate reaction is that it could be a permissions
issue...

Patrick
