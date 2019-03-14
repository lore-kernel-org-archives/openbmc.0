Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cRtVXMEZ"; 
 dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44KqYh2PRTzDqHZ
 for <openbmc@lists.ozlabs.org>; Fri, 15 Mar 2019 00:39:03 +1100 (AEDT)
Received: by mail-ot1-x331.google.com with SMTP id c18so5077568otl.13
 for <openbmc@lists.ozlabs.org>; Thu, 14 Mar 2019 06:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=c+wuU7rKkC4QYElaCp5XrlpBbPANxZOuyIB8o697qiI=;
 b=cRtVXMEZvWDjY64h6J489HPcxRJbupCZO3JS2C8IXNv3W9etCZTBoqna9H05W5cXgt
 Pqtvxo9PyudHbsm6nFHvtGnQ/b1QJ5o8yU7Mgs/kUUJYETuOdp0Ze4KEe1J0aDjYyeTp
 Zm28Xet3vHAN6g6qjnoKNupdDrJYMMEqKBaIvRz7I4D0v9P2fLFmCZN+U4gG8mTjncP0
 Uq/nJMIpsiKSdJWXA+DSDKQyrqjdd8bCylvOvFWchjDdekVfRcBKkthgU7N3sRda7AIZ
 Z17pXDT96MfLvQpexVETDlWy52w6Nqe2iMP5GYxrZIvAIq1EPC92oT17RJTX/zG8n7Ma
 XrDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=c+wuU7rKkC4QYElaCp5XrlpBbPANxZOuyIB8o697qiI=;
 b=k+dkEnWDc/ZLcy3hZICAzVJpMlqP4ChUTtCcZIxvxD6LfmkhHdDeOmjfKSY5FKA3Um
 AWnuI+IozDlz2wV/culSkdxpI34JezNXAuY5MlV5akNiJiPZNJHUreqhfdcC8XJ0uBAh
 tuDZWPL6zXe3F4xZN/vPxO9pQWexCzxMqIrMCbnz8oqkW4u+FSigX0exV/ET8SMnlb7y
 5MxdbMQVt5sGp1npoRal5gDrTxZPO57NIEPQwdh7kzcvaoSks7IinaIjj4ijZgN2+CNY
 JVu0IAu20e3t++BbHYiONZC6tCN8mAkYOgABNJHbJHe4ZQiPo0S1lxACvVq3Sq5xcCN3
 U4Sw==
X-Gm-Message-State: APjAAAXZeMB109mU71ZBRSTz4bJ+6cxZcdZAyIZoMgy4304jz7Q4QDOR
 NLcLBKDmS26S4vpGSs12PYwAP74nT9/9q0OFpvKffwIw
X-Google-Smtp-Source: APXvYqyyz4uAIrOif9nVfGmJ3eDcls3zGiE5b6TI890tKeqMttkO+KkA0bpSAgyqWFqjj028WMdRaOBIETk17KbeFCY=
X-Received: by 2002:a9d:7143:: with SMTP id y3mr1027272otj.12.1552570739811;
 Thu, 14 Mar 2019 06:38:59 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 14 Mar 2019 08:38:44 -0500
Message-ID: <CALLMt=qZOxWDH8eDqv6JYbkvgk10mR1K_REgnE-DkssLWD=iVg@mail.gmail.com>
Subject: CI to stop testing meta-* layers not in tested machine
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 14 Mar 2019 13:39:05 -0000

I took an action item from last weeks Infrastructure Workgroup.

The point was we're wasting CI resources by testing meta-*
commits that are not actually tested by any of the machines in the
CI job. We're also falsely marking those commits as Verified because
if they are not in any of the systems under test, they're not being
tested at all.

The systems currently run as a part of the meta-* CI jobs are here:
https://openpower.xyz/view/CI/job/run-meta-ci/

Some quick grepping indicates the following meta-* repos are not
being tested:

meta-arm
meta-evb
meta-google
meta-hxt
meta-inspur
meta-intel
meta-inventec
meta-mellanox
meta-nuvoton
meta-portwell
meta-qualcomm
meta-quanta
meta-raspberrypi
meta-security
meta-x86
meta-xilinx

This would mean the maintainers of the above repos would need to +1
Verify the changes to these layers before merging.

Are there any advantages to running CI against meta-* layers that
are not in a machine being built? Are there other machines we can
add to CI that would cover some of the meta layers above? The
general criteria for getting a machine added to CI is that it's actively
being developed and supported. We also need to balance our
CI compute resources so the overall goal (in my mind) would be
to pick the machines that cover the most meta layers.

Andrew
