Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hI16TyNp"; 
 dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Z9855mzmzDqKZ
 for <openbmc@lists.ozlabs.org>; Thu,  4 Apr 2019 02:33:09 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id t8so15776039otp.7
 for <openbmc@lists.ozlabs.org>; Wed, 03 Apr 2019 08:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fuY9huOjC6H/AEauBYAcrIyGZ3Ane0/FulVoUBYis28=;
 b=hI16TyNpN0X5Xdzy+Wnq4Q1N6nIoveElYJz11RhBACWlz4DYOkldPnxHcFa13zRG7R
 uPDAGbs7ZEGDlmJ38lZREsFvLXfgHOCUPBC0lfG5w+AU7boJNSWKPcMzGWUarvRli2V4
 xuoqWPYc3py0LY4bGyiwMsq2gw+Im6nYFi5B2C3C4M4gzRzGbITYUtUE84jeQLFm1C2x
 ZPMGhw9ykNLM2T4dVLcosmT7oj2InIBlRUffJWNumDz+0mtP5Be/Tc9C13J3oNdXzawg
 +clSf6gSoZNVGVNlGBemNBdh1iHkpoF0+g0l6WM2PnTF2d7uBpR5nMK0YDs22ry3AAXo
 sxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fuY9huOjC6H/AEauBYAcrIyGZ3Ane0/FulVoUBYis28=;
 b=H2rWJ6UjK9e/c5+ZOlsUNMDdSKAAPPIIvaPFp0hdFF4hyadrpN71Cx5o3PLk7k11WN
 BMRP2160uZ+Tq6PmttpEmiI4kCbpaG9+Pvde2WSAOn/6qyIIzeq9KHpcH3F4ol3SRDQt
 naFEPcryczX9P9c8culOKQICcbtzA7iElpukwacR7eEf3fxqm2CWm86vM/k7/+AqQpmt
 s7IdnzH1uVj9RwF8CV121kD/DWTn/VjW3Fay7VRVywojD3mP6J9448TbvyGTta8BxhCU
 iSIcdOJesg4TxnV3mfR1a0PV5WaegMEjNv8sK/iZPGU5QZhW9iwI8vt5mLTCeLFRwrmp
 y87A==
X-Gm-Message-State: APjAAAX8W1evJgRjjUHEIUBrK9Cyj9X/4nGNA5D2gTpK7vz4Nm/He8WI
 AK/COSACwcXxHfLpyHsNfoePvbGpeNkfta2nOVY=
X-Google-Smtp-Source: APXvYqwC1yznYO6HAVp9AuLwLuBTTQmYBppZ+I6eEYdvSAwRvBnpLvvlzgZbZfH+wVnXScutIXs6tg86fPn1lAY87Oc=
X-Received: by 2002:a9d:32f5:: with SMTP id u108mr57484otb.153.1554305585972; 
 Wed, 03 Apr 2019 08:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrt=oNUnnPHXnbybAPAvdq9PvxHe4B3GiX0BYw6rdoXgDqw@mail.gmail.com>
In-Reply-To: <CAARXrt=oNUnnPHXnbybAPAvdq9PvxHe4B3GiX0BYw6rdoXgDqw@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 3 Apr 2019 10:32:49 -0500
Message-ID: <CALLMt=orZcWQ+A-dJwd+QKroYe78AK9LXTr=BsjeJiVpQj69SA@mail.gmail.com>
Subject: Re: Proposal for removing legacy code update services
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 03 Apr 2019 15:33:10 -0000

On Tue, Apr 2, 2019 at 10:48 PM Lei YU <mine260309@gmail.com> wrote:
>
> Hi All,
>
> With 3ba97559e, OpenBMC supports PNOR code update by
> org.open_power.Software.Host.Updater.service, with the steps described in
> [host-code-update.md][1]
>
> And before that OpenBMC already supports BMC code update by
> xyz.openbmc_project.Software.BMC.Updater.service as well, with the steps
> described in [ubi-code-update.md][2]
>
> So it's time to remove the legacy services that could be replaced:
> - org.openbmc.control.BmcFlash.service
> - org.openbmc.control.Flash.service
> - org.openbmc.managers.Download.service
>
> What do you think?

Sounds good to me! Get some more python applications out of our images and
makes it easier to have standard CI tests for all machines.

> Thanks!
>
> [1]: https://github.com/openbmc/docs/blob/master/code-update/host-code-update.md
> [2]: https://github.com/openbmc/docs/blob/master/code-update/ubi-code-update.md
