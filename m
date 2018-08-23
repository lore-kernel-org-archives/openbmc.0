Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JonsKMol"; 
 dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41xHNT5wyyzDqKl
 for <openbmc@lists.ozlabs.org>; Fri, 24 Aug 2018 07:19:21 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id h17-v6so3270692pgv.3
 for <openbmc@lists.ozlabs.org>; Thu, 23 Aug 2018 14:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=7JdVBH1KaR7NJtGpxfm9EIwB1bvpnFgmlvGhRIAMr5I=;
 b=JonsKMolgEG+HkWoZF+6U3rhAYiJ9AafqlOuWnhVXrrYwVEcCO4t3xdJOhY3Ax+gHz
 qL2Y0+tdl/98ApNb8Gq32hJaDnz2o/YXLIJ0yxW88dcaJfWohGRxvrGVFx/ykrGEwa9s
 5HhcSv4HX38S+hGzRvpbbg3hbtEmnbT7tuI0q8pvexgW5tCnZMnOM68XNaQkA+e+9AW1
 QywMuIP2OVfE5HvAyVhQyR1yQ23/y6gKeflw2eccCEpokaSOc8fdnGbXJXZiY/D2dVSw
 QLu1U9cSlAX+PGLVeoR7Nt7aKbf7kJj7okW5Ki3SisXvK1WQBwcq6ELtBfcWmLNxbto5
 /U6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7JdVBH1KaR7NJtGpxfm9EIwB1bvpnFgmlvGhRIAMr5I=;
 b=cWEWOpggYvPcYhetwzkfr1vybXplWOUc/lmxTVO/UAGaVJYwZJRfEJCUzoyNHcFaSX
 c0TUx6F81k/YApBDAOKqA9cPAVzzA7h3bCAeF8rhKXYfpxMEEHktLrFQWvD/QCh4qM4m
 ixH8hRA1VFHndw33mmUn7BjlH9StNiigJXq1bID1HQMdtF2teJqTGNpLHwgLzFXk85e2
 bm4fe0a1AhOAVWu+rax8yYLZnvAZ2fC46H+XXU4PMbk+eTmUVCFQ1dVrn3PI7v7aj9Wm
 4qDkSYjXJK5+oJMqZbVBXuTLQjaZcWXDcVm/xOPz98Ap8+RUPZ0kXa0Xtub1HWUXSksM
 g3Zw==
X-Gm-Message-State: AOUpUlGcIQzSjeRHTfSr30+RKLXZibq8assT+9UJLceWwHYlEknaJw2r
 dMMiYFTUcppG2irwnVM91oxggHWKnMWE1Q/WQHpbkxQOLSM=
X-Google-Smtp-Source: AA+uWPzU+ofZ0sbnYOZU7rz6i/nTrUb4Y1hqJ3yEFAO4DW+2ob1iZLuBCdAa7vjAYvzALjk2aL3XlyH+n1U7Q5BK5Hs=
X-Received: by 2002:a63:a5c:: with SMTP id
 z28-v6mr56363039pgk.209.1535059158888; 
 Thu, 23 Aug 2018 14:19:18 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Thu, 23 Aug 2018 14:19:07 -0700
Message-ID: <CAO=notww5kS39b-OH2oAD=doMR_yUrunzFaAKK+=B=G42fc9KQ@mail.gmail.com>
Subject: Warnings from building at HEAD
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 23 Aug 2018 21:19:22 -0000

I'm seeing these warnings, is anybody else?  (Building quanta-q71l as
of a few minutes ago).

WARNING: libgpg-error-native-1.27-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to
incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch 0001-syscfg-Add-ppc64le-cross-build-support.patch
patching file src/Makefile.am
Hunk #1 succeeded at 61 with fuzz 2 (offset -3 lines).
patching file src/syscfg/lock-obj-pub.ppc64le-unknown-linux-gnu.h

Now at patch 0001-syscfg-Add-ppc64le-cross-build-support.patch
WARNING: phosphor-ipmi-host-1.0-r1 do_unpack: noskeleton in
MACHINE_FEATURES. Remove mapper-wait on host settings.
WARNING: libgpg-error-1.27-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to
incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch 0001-syscfg-Add-ppc64le-cross-build-support.patch
patching file src/Makefile.am
Hunk #1 succeeded at 61 with fuzz 2 (offset -3 lines).
patching file src/syscfg/lock-obj-pub.ppc64le-unknown-linux-gnu.h

Now at patch 0001-syscfg-Add-ppc64le-cross-build-support.patch
Using an insecure image signing key!
WARNING: python-pygobject-2.28.7-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to
incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch obsolete_automake_macros.patch
patching file configure.ac
Hunk #2 succeeded at 82 with fuzz 1.

Now at patch obsolete_automake_macros.patch
