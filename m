Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jiMLyV9z"; 
 dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Z6FR1r9KzDqZx
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jan 2019 09:22:18 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id b5so2558141plr.4
 for <openbmc@lists.ozlabs.org>; Tue, 08 Jan 2019 14:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=xoHNqeO0gdHAkobxadkY3XAsbBWXppkP82Dh3Da0QjY=;
 b=jiMLyV9zksr78qk88obV+MxXEQKDEVmYnpQIOBWCdikZdVB9B8ao5XM4u82ActnrgW
 9Bj/LB57Oqa7ECteJQeAP9g4T1WMAiabPEGD/OPX3X2wz8KbxjSCcNXUmYRNee/nKhy1
 RgWIpZN4UDp2nzno1k3ecnkj6sGf/g64mDS1mLGxeoLFaupsD2T5x4LusVzNMKRpsT8U
 GL9TeJ/+bsD/JbqrQ/L1jKfbyKMqygYk0xfNzT9knX5ZrGTU6WeqvSJNyCCMMpxdyU1l
 hSYaZbKkZMuKCelmfbjFoWWF7yKBEAJc3BpV6GZBFhiU3EimazhQnOEgIZJfVF1xCsCz
 tusw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=xoHNqeO0gdHAkobxadkY3XAsbBWXppkP82Dh3Da0QjY=;
 b=gT5SRG00h4EiCdKPC3sYnCBGknH52H480EYncGL99mMrC2oAXMbebsLXkh4HxRJkxI
 jAB+1lAnXXx1DxuUJut207pLep9xgcDsYp9M6Y5FbaSetz5h7OIslnisAVIyceBrci/P
 y2/AtlUuo70LrVvSsVC11IesI9gQkK6lYewyvYU7Uflvi9aInYjJOnevZOSgpemnmdzn
 7eqAAzLz+apESwfzxTKJRyU4hxggL57h+2KKZ+bBipmG982BLZb6k8enzoaGLmS2f63A
 ypMfas6O3iDIKf5/nzXvz6Sc4RhIPH4IZaa/0XTk3UkmtbrxxBerl8KqE9WtMebzqJpo
 o93A==
X-Gm-Message-State: AJcUukeRNCKIT1l8fAOtB8FwlX3roeDuPezmeDLnSkEYJcQEmgDT1nNg
 3r/qcrgVfVBwH1b+XQrYEyUs9gbxUrvK/MvVHLBxyfY2JA9egA==
X-Google-Smtp-Source: ALg8bN5LNwzes2n+FdXugtyLHASZiowDo5iqSCjgtgrnYNmG0RtZkwLwGl/xpWBGR/bOhbrNIC3EIDX48zh+bM0K0Gg=
X-Received: by 2002:a17:902:8541:: with SMTP id
 d1mr3596433plo.205.1546986135872; 
 Tue, 08 Jan 2019 14:22:15 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 8 Jan 2019 14:22:04 -0800
Message-ID: <CAO=notxXfcvs0SfBLoR5MCqt+AHA-V+7j4TRWmaKgxm0pqUFHw@mail.gmail.com>
Subject: Unable to override file by machine for phosphor-ipmi-fru-properties
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Benjamin Fair <benjaminfair@google.com>, Nancy Yuen <yuenn@google.com>
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
X-List-Received-Date: Tue, 08 Jan 2019 22:22:20 -0000

With phosphor-ipmi-fru-properties, if we set the
FILESEXTRAPATHS_prepend to be machine specific, it can't find the file
and doesn't add the path, but if we leave off the machine override,
it'll find the file and use it.

https://github.com/openbmc/meta-ingrasys/blob/master/meta-zaius/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties%25.bbappend

This specifies that for zaius, it should prepend with this path and
use this override file.

Deleted the extra-properties.yaml file from the original recipe and
tried building zaius:

WARNING: phosphor-ipmi-fru-properties-native-1.0-r1 do_fetch: Failed
to fetch URL file://extra-properties.yaml, attempting MIRRORS if
available
ERROR: phosphor-ipmi-fru-properties-native-1.0-r1 do_fetch: Fetcher
failure: Unable to find file file://extra-properties.yaml anywhere.
The paths that were searched were:
    /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties-1.0/df-openpower
    /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties/df-openpower
    /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/files/df-openpower
    /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties-1.0/gbmc
    /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties/gbmc
    /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/files/gbmc
    /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties-1.0/
    /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties/
    /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/files/
    /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties-1.0/x86-64
    /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties/x86-64
    /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/files/x86-64
    /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties-1.0/
    /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties/
    /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/files/
    /usr/local/google/git/workspaces/building_122514933/build/downloads
ERROR: phosphor-ipmi-fru-properties-native-1.0-r1 do_fetch: Fetcher
failure for URL: 'file://extra-properties.yaml'. Unable to fetch URL
from any source.
ERROR: phosphor-ipmi-fru-properties-native-1.0-r1 do_fetch: Function
failed: base_do_fetch

Ok, it can't find it.  But when I delete the machine override on the
line, basically delete "zaius" it then finds the file and uses the
zaius file correctly.  This behavior is baffling me, does anybody have
any ideas?  Has anyone seen this behavior?

Patrick
