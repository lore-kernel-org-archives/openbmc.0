Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x241.google.com (mail-ob0-x241.google.com
 [IPv6:2607:f8b0:4003:c01::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2A6F81A0331
 for <openbmc@lists.ozlabs.org>; Mon, 15 Feb 2016 11:01:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=IfYiquv1; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=WUay/DOb; 
 dkim-atps=neutral
Received: by mail-ob0-x241.google.com with SMTP id o4so14717693obb.0
 for <openbmc@lists.ozlabs.org>; Sun, 14 Feb 2016 16:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=sWA+KWfvd6tpCdsoh58PjIL2A2kQIuIgnsz7kq3n/oE=;
 b=IfYiquv1o97b49p26OHvPXgNPKPDk5KoAAOW6GJ9TiMuKIHCS151zoXy/o/ynM++SA
 Umpt/FvNdoPDGFWjzILmsZqtcdFDb0TLIklR+Eg0KhWiPQgs7B698EBRlMcrmRl90KHe
 0oVo1yOxqB/+bawd+1xlkD66Y+APw0VglCsn74KJga4CTMXVkklbaGIEKCTSPCGriGjB
 AV+bDseYXoZZtN35XkxjOCECspvwrXHRQHrs2+BBmwthIyZZwOYfOhVH/z9C6HH1Ct/P
 Db3wc8wVNj3RnEfQpcTY+Rv2Z64dSYaRp4VjIOueVo63ow2KYjq5dyZHszPy4TEszSoo
 DW9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=sWA+KWfvd6tpCdsoh58PjIL2A2kQIuIgnsz7kq3n/oE=;
 b=WUay/DOb1/7AR6cwiUw81jCCTiW5aqRxuimcFHt1jN3O5gp6AasX8N2dgBLAcNwtqD
 vAUK00vG1+0HIiaU/WX58yRa7evuD6HDlzdAgv98tK3TyVjnAr7vEBHjMRGFsOqCfG/A
 YXh+Mp02hjyda/Xzwo8K7OQsJugeVGb2lTN9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-type;
 bh=sWA+KWfvd6tpCdsoh58PjIL2A2kQIuIgnsz7kq3n/oE=;
 b=mD0tuTK32zL+zhg5Fef4kgu0Q2kzpElOTABg/S3Et2quWcgVe6h6PoGK9TyEWhvRED
 6QTykMzp85dL259Bz9IBRrXztSWOANDaUESSvgw0oXGOZXboJk1WdwR6MOtZDgNdHWPp
 q8hIuL/WwM1uhS+2HhbAPsLFIV0v9eYa3aGWz7pMrAUGWZnYeZOg26VVzmaW9Tbe1pCV
 i3aFj0w9vfHvXOVv7qt2r787xuZU8t3cK0Li6TZe/LSNLfXsnGB48dLIfdKLZP6Rg7iH
 Rmmk1H7iN1nGbDlZV3SHBOTWdL6VGwDcSTR+zypeaYkVJMhnR3TGW5xTm2yrhe5v/ttt
 XSwQ==
X-Gm-Message-State: AG10YORLJROxb6IfPAm8sd+zfXPXP59+NTYLnUITt+vjB/GxqvYr4Lz1KcK6jojJDTbc822HRywVaexC7frfFg==
X-Received: by 10.60.220.230 with SMTP id pz6mr10424420oec.49.1455494512318;
 Sun, 14 Feb 2016 16:01:52 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Sun, 14 Feb 2016 16:01:32 -0800 (PST)
In-Reply-To: <87wpqajdrw.fsf@gamma.ozlabs.ibm.com>
References: <1455254421-26850-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455254421-26850-2-git-send-email-openbmc-patches@stwcx.xyz>
 <87wpqajdrw.fsf@gamma.ozlabs.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 15 Feb 2016 10:31:32 +1030
X-Google-Sender-Auth: KViG6jY5AX-TEEjW6Zn6qJ-eZmw
Message-ID: <CACPK8XcKJv_dk1YFtEGopLMw1m+3s59kjHrJ+H1PmgdVtjg_QA@mail.gmail.com>
Subject: Re: [PATCH openbmc-build-scripts] build-setup: Ensure we fail the
 build when a step fails
To: Daniel Axtens <dja@axtens.net>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Feb 2016 00:01:54 -0000

On Fri, Feb 12, 2016 at 11:18 PM, Daniel Axtens <dja@axtens.net> wrote:
> When writing bash scripts I tend to use the invocation from
> http://redsymbol.net/articles/unofficial-bash-strict-mode/
> i.e.
>
> set -euo pipefail

Thanks. I updated the build script; can you take a second look?
