Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="v2yWhGvS"; 
 dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43mTC50sn5zDqPv
 for <openbmc@lists.ozlabs.org>; Sat, 26 Jan 2019 06:11:11 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id v28so4573083pgk.10
 for <openbmc@lists.ozlabs.org>; Fri, 25 Jan 2019 11:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=NM07DD92mheaqcA+DuLvYen3v1N/yQ/gvUqtqhjB3E8=;
 b=v2yWhGvStsD5lp4vZAeu0D5i/mk3U0BwWr3N5KrlomLJNdN+ZwGxDDJGjYu7sQwpRD
 +DKtdllti24F1itqVbopV5Da1QaM6kRoMuERQpnq9vsZBiJiF4em5KsbjNnh/qa7e7EJ
 jTAVYTJ9tDchFXsAiB4iU27/uFI5H4KX0xcCWKbPZqkV+uZWyibrX0depLpu7lFRPznp
 liCMtC0uB7RWvIUgY0Z30vso3tBfOD9ZNDDZxF1+34s5T5y8c6t8vC9dTPLRU1wkrUvy
 cTl9jT6uGyTj9kft1b5KwAme71EHWiL0cpatIMbDDXZ93i/vAMMh+BRvOWzxoDXONN0E
 i5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=NM07DD92mheaqcA+DuLvYen3v1N/yQ/gvUqtqhjB3E8=;
 b=LR9yBUEgmFaccgq8x9XVPmbY3gpWkhBJ6UTAukSH4fOCQc/2dPFC3pLQvG+wNMukEL
 l/HDDY1f8eMwbw1kC4OuKy2LKnQJN8mf62UJK7h0a61QHBoy2ey36btWvTRYF84Pauvc
 XSPw2IPF1qzN3Y2BnNRDfsRQTcmWoo6NTE1QpczWCi/hPSK6YD0Bc5PsnPWw2OqSfyiJ
 7P0+830SQAMrHVVRzoQXWtInzHKlMVAx7SK7+ldr2Q3rwQO1mOFyvYQXDoKWgQ5E0wPm
 3fhzzSguQ6fxST68u1gOuGUIc3k53c1HBEe9rDqenWtJ+NzQ3yykWZ0NW2zODl4l8ng5
 92dg==
X-Gm-Message-State: AJcUukeUQc4F6RyJl7fZeUzkWaPTI7IRa8FDCj1i5/GnY8t3dZoCHuZd
 Wdxscp/zHDN2qBHpSOgvOSPOy7HAxwkDSR9lZV2+HwvDF0AE0Q==
X-Google-Smtp-Source: ALg8bN6TsCapBCxc4XsgRZ+Q2VA51HMTpMIWFzd/L+XWQtHK+W92xhAT/JcNv9yPirsX4RKsl7XUgPo90HoMAZIO6JY=
X-Received: by 2002:a63:5e43:: with SMTP id s64mr11089551pgb.101.1548443469296; 
 Fri, 25 Jan 2019 11:11:09 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 25 Jan 2019 11:10:58 -0800
Message-ID: <CAO=notyYfCk5L984Q96C1vNQQ85BBWhxS1p8HEo0NXEEzj+dkg@mail.gmail.com>
Subject: dbus-broker build failure thud transition
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 25 Jan 2019 19:11:15 -0000

Seeing the following while trying to rebase onto the thud branch.
When I just build Zaius upstream with the thud branch it builds
dbus-broker fine, but not otherwise, so I'm curious if anyone else has
seen this?

ERROR: dbus-broker-16+gitAUTOINC+fc874afa09-r0 do_unpack: Fetcher
failure: Fetch command export PSEUDO_DISABLED=3D1; export
PATH=3D"/usr/local/google/git/workspaces/building_thud_rebase/metabuild_reb=
ase/build/tmp/work/armv5e-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+f=
c874afa09-r0/recipe-sysroot-native/usr/bin/python3-native:/usr/local/google=
/git/workspaces/building_thud_rebase/metabuild_rebase/scripts:/usr/local/go=
ogle/git/workspaces/building_thud_rebase/metabuild_rebase/build/tmp/work/ar=
mv5e-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe-s=
ysroot-native/usr/bin/arm-openbmc-linux-gnueabi:/usr/local/google/git/works=
paces/building_thud_rebase/metabuild_rebase/build/tmp/work/armv5e-openbmc-l=
inux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot/usr/bin=
/crossscripts:/usr/local/google/git/workspaces/building_thud_rebase/metabui=
ld_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/dbus-broker/16+gitAUT=
OINC+fc874afa09-r0/recipe-sysroot-native/usr/sbin:/usr/local/google/git/wor=
kspaces/building_thud_rebase/metabuild_rebase/build/tmp/work/armv5e-openbmc=
-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot-nativ=
e/usr/bin:/usr/local/google/git/workspaces/building_thud_rebase/metabuild_r=
ebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC=
+fc874afa09-r0/recipe-sysroot-native/sbin:/usr/local/google/git/workspaces/=
building_thud_rebase/metabuild_rebase/build/tmp/work/armv5e-openbmc-linux-g=
nueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot-native/bin:/u=
sr/local/google/git/workspaces/building_thud_rebase/metabuild_rebase/poky/b=
itbake/bin:/usr/local/google/git/workspaces/building_thud_rebase/metabuild_=
rebase/build/tmp/hosttools";
export HOME=3D"/usr/local/google/home/venture"; cp -fpLR
/usr/local/google/git/workspaces/building_thud_rebase/metabuild_rebase/buil=
d/downloads/git2/github.com.bus1.dbus-broker/modules/subprojects/c-dvar
/usr/local/google/git/workspaces/building_thud_rebase/metabuild_rebase/buil=
d/tmp/work/armv5e-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa0=
9-r0/git/.git/modules/subprojects/c-dvar
failed with exit code 1, output:


cp: cannot stat
'/usr/local/google/git/workspaces/building_thud_rebase/metabuild_rebase/bui=
ld/downloads/git2/github.com.bus1.dbus-broker/modules/subprojects/c-dvar/mo=
dules/subprojects/c-utf8':
No such file or directory

Patrick
