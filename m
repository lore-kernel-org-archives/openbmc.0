Return-Path: <geissonator@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::229; helo=mail-io0-x229.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="N9JsPqvt"; 
 dkim-atps=neutral
Received: from mail-io0-x229.google.com (mail-io0-x229.google.com
 [IPv6:2607:f8b0:4001:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yx8dh1jVrzDrXZ
 for <openbmc@lists.ozlabs.org>; Wed, 13 Dec 2017 06:14:30 +1100 (AEDT)
Received: by mail-io0-x229.google.com with SMTP id o2so132564ioe.8
 for <openbmc@lists.ozlabs.org>; Tue, 12 Dec 2017 11:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=7qpZy9+k6TWQWpzsTvuKsHOJut60axgaC5xhaUim2Ik=;
 b=N9JsPqvtJ62uIlHHHc/1+91VT3f/Nn64PCAcEcqrHeVf37tqWNH1Gigep5EF+QdUKT
 3c7t4/KtuimJvuGLSrKtKVlD0N4ArQSSMEp7MS6PhI72XR6+kQYwdoqOwah3iXhZvNYH
 YyApbRomOYn79xgX6q5lZQrmZRzZOMXBZ4A+9TCltf6V6Puv/JJZUGaDafLEe5HRMpq8
 kIAhu5ORJduUPIz7W4AOrTdotGBkGoUDqk32dCDORcJMW1mEV86AovZHSjpgbTD/Rdt+
 QA1Beer2aDGg/HisL8TZUoZwwSGq/yKUlNZbJ/CRhnf4gOJ/PxgxYCHMqGg93tkhEp9k
 QwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=7qpZy9+k6TWQWpzsTvuKsHOJut60axgaC5xhaUim2Ik=;
 b=RDIcqwY0l/KWU2AbncbuwhLOtJM7mNsXxgFLINJnLskfpaHp5oU2X+P8VV4S6CL2Bq
 Wswo6OSe9KMNH8IX6/cQLxXatjEVL9XZunKi9igpJ5TFxXhkvmym67XIZvKtZKni8qR3
 MtLVtlgT3odkCWCLm2gQ0dzfiSOfrkeSvMHLw28txbVS6V+S4EMxFkf7T675qad8fPXE
 +cdltBMmV03MvQltHrdl4XSMTUgmMVQzIhgq1uwylmp2ufEdU+Q5DCXHMZGLv9nUb8X8
 cb9Kw9nLQdPKaqtN06mu6JY5zsyUX0FtV0ME+RuCGBkSAbyyQd6s6HhRCyy2TtQz9ezb
 tfyA==
X-Gm-Message-State: AKGB3mIAdQnyTtjREZgDpaMcOEQI2Qyg/UKPSpnYQQ58ogVWZDchUTEP
 E1kIfxgmxa209DjI1loHP8NvKyruZipORC85JZw=
X-Google-Smtp-Source: ACJfBouuHcdDWNXo5+fzZ9QpEH4ue5RHL0BpQliLvJgeKx+puqiXxdOmEPxc9JAi3zNhRgXplMZnszIIY9ou5rCgGS4=
X-Received: by 10.107.11.91 with SMTP id v88mr6968462ioi.179.1513106067184;
 Tue, 12 Dec 2017 11:14:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.159.76 with HTTP; Tue, 12 Dec 2017 11:14:26 -0800 (PST)
In-Reply-To: <OF113B399A.B511E757-ON002581ED.0019E0EA-002581ED.0019FDF6@notes.na.collabserv.com>
References: <OF113B399A.B511E757-ON002581ED.0019E0EA-002581ED.0019FDF6@notes.na.collabserv.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 12 Dec 2017 13:14:26 -0600
Message-ID: <CALLMt=pVW5N4=PbKaM8XOws-vQcii23vCutC4zPzpW_5tmH0-w@mail.gmail.com>
Subject: Re: Host factory reset - version priorities
To: Michael Tritz <mtritz@us.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Dec 2017 19:14:33 -0000

On Mon, Dec 4, 2017 at 10:43 PM, Michael Tritz <mtritz@us.ibm.com> wrote:
> What should be happening on a host factory reset?
>
> Suppose we have a machine with two host versions uploaded - one active, one
> not. Currently, the host factory reset will clear the persistence files with
> which we store the priority information for these versions. The next time
> the host software updater is started, both versions are left with priority
> of 255, and one of the two (maybe it's random, maybe it's based on upload
> order) is selected as the active host version.
>
> Is this the desired behavior? Would it be better to instead retain the
> version priority through a reset, or is clearing that setting under the
> scope of "restoring factory settings"?

I do not thing we want to lose the priority on a factory reset.  We
have to ensure we always
use the firmware level that the user last activated, no matter what.
The "spirit" of a factory
reset is to clear any changes done by the user to defaults of the
firmware.  Ensuring we boot with the right
level of firmware is still required after a factory reset.

Andrew

>
> Michael
>
