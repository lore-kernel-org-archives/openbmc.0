Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="H+Ceg+3V"; 
 dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44DPk96fjYzDqCs
 for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2019 04:57:37 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id u9so6277880pfn.1
 for <openbmc@lists.ozlabs.org>; Tue, 05 Mar 2019 09:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dzqR5BDvzZKWRSk/D36odV39qrcmMU3mDF5uUYEScSI=;
 b=H+Ceg+3VZupMJrrZMPczxLnrmdgJ02+sPZ51IBI5or3wRqnsof4iEnRa3a4u17X68i
 zmAKM5gGS1lEuNheqaW/8ttIvaHnlHFQ++cL8MDiKawG0i/FO96hA5mZKtDdLZEgDlkM
 orXair2Latt7sQDtsti12WOp1YygEU8lbC8GQBPC4GeAN4jecdRuD2xzuA3zkFsvCdM1
 yc/E23GPESS/g66uHjBTjEiMDMc248vux6AofWjRaaJ0Vm/7kLyKlPE6Ee2eKn1J7z5K
 wpolmCGPMoLKzGm97beyZT2skbtgWwdVsxZp65PySV7w7coTONTD1dFId+j3FPBMysLj
 MRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dzqR5BDvzZKWRSk/D36odV39qrcmMU3mDF5uUYEScSI=;
 b=nsGDjXjQXvQ3Qq9AzbwCLW7ztiHsiEOygRDJYX/o/fB4VgxJvRoQGJS3IBTkfZ3RG6
 FBZeSIM5Ry83SBSXXmukAkdW58JHAlm755YAwhSDwie3VvWN/6ANaaUebl+h/7oM50g4
 iseYcKRK1l5LKX3I7cUp3jdVKY6UeHwgkUV4MHD12kRKPRoFOlQJr96Y60Y+LLMuLEMu
 9cdq3iXdDQiYZY4FJSYyYDO/SS4rkmSKtejrE8RcsE4Qbdta/kyUMGM8KpdkCtC1vLXS
 QXs0YgoIuC+yQDZ4JTfXAm93P8+cUHBmd+lCyiKvluaVP4CL+L5mv2XUTblXG2h02qle
 jORQ==
X-Gm-Message-State: APjAAAUz+cZMTjtnDpfTEYSNZP13vIFywiAesHcY5CEoaBVMyXwaB7/J
 GAGDqDrglbCno5yzXsWuDaGwzYvfvDU9SgOkFi7Egg==
X-Google-Smtp-Source: APXvYqyxLbLfSKk3cujk7+zsfj//oYgbS2yIS42na720JEesZUDKsGmchWwiYbcjU7rBGAKjqEjgCpEFAfm/dfnvzyA=
X-Received: by 2002:a17:902:8b83:: with SMTP id
 ay3mr2330047plb.1.1551808653484; 
 Tue, 05 Mar 2019 09:57:33 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notwtEi-z1BW9T6mgTHz2uF5Y9=O=N1JpXK0sNNVyajjsGw@mail.gmail.com>
 <CALLMt=pdTeDDen1UWfGae4oDzeZoUD8wYD3YDOzsTL60YDVYrA@mail.gmail.com>
In-Reply-To: <CALLMt=pdTeDDen1UWfGae4oDzeZoUD8wYD3YDOzsTL60YDVYrA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 5 Mar 2019 09:57:22 -0800
Message-ID: <CAO=notzAne_ixwzPbr1LyJsof2t88_Sqxas0aB52P8p1KRzvHQ@mail.gmail.com>
Subject: Re: Bizarre CI Failure
To: Andrew Geissler <geissonator@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 William Kennington <wak@google.com>, 
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
X-List-Received-Date: Tue, 05 Mar 2019 17:57:39 -0000

On Tue, Mar 5, 2019 at 9:26 AM Andrew Geissler <geissonator@gmail.com> wrote:
>
> On Tue, Mar 5, 2019 at 10:48 AM Patrick Venture <venture@google.com> wrote:
> >
> > https://gerrit.openbmc-project.xyz/18327 is failing:
>
> Yeah, better open an issue on
> https://github.com/openbmc/openbmc-build-scripts/issues

Done. https://github.com/openbmc/openbmc-build-scripts/issues/25

> Some sort of permission issue with the generated files from the docker container
> build. This repo is pre-built into the docker container and then when CI tries
> to rebuild the repo, it's hitting permission issues with the
> pre-existing file. No idea
> why it doesn't recreate in your env though.

Maybe it's a docker version issue, or a permissions issue associated
with the area where the docker stuff is installed.  Or a difference in
how the scripts are run, I'm using:

sudo WORKSPACE=$(pwd) UNIT_TEST_PKG=openpower-debug-collector
./openbmc-build-scripts/run-unit-test-docker.sh

> I verified it hits multiple of our
> CI systems.
>
> > Patrick
