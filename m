Return-Path: <joel.stan@gmail.com>
Received: from mail-lf0-x244.google.com (mail-lf0-x244.google.com
 [IPv6:2a00:1450:4010:c07::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xW2ml0rrvzDqlD
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 14:33:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cDRO32nX"; 
 dkim-atps=neutral
Received: by mail-lf0-x244.google.com with SMTP id x16so5836407lfb.4
 for <openbmc@lists.ozlabs.org>; Sun, 13 Aug 2017 21:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=dvulD1ZUlEdDYAjZO9P37afXs7NKVNSnnGSgh7LjbKE=;
 b=cDRO32nXGua9f2wXwu7uvPCS4Y9FDR5nq8ZsODQT85SAY3JnOMHBf3uCNRMhPihSGY
 Z3tcJyNSfznyhhtj9ENigjyw+PTZ7Zl4bH5kV3LdjLvf2E8KeyXc/mMDZdT5VNkZ2GUi
 Rs4O2wxlbl+hUHqGGJLx8ADGn1sfIZim5Qk4LupoZnwP5WZ8c3UyWujOsVoCqZAWjSsi
 NinsDuAeIEeIUN/u+y1meqKtugBeY1d3ahfi/XIj9kodQbTtLfr1QAueodZWKTyOw5AQ
 9f7N+d8qCGFQRRt4g5nmrPbXqT8jLojfdZpHrm7sRPqptnIYop4noSb05wLs/QVCNejQ
 GoRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=dvulD1ZUlEdDYAjZO9P37afXs7NKVNSnnGSgh7LjbKE=;
 b=i4BUjdnJBFXetvMS3C7Z9KwYC6cvzr3KE51s9pcrl4al6xHevfnXyIX9W6Xra5Ifvt
 HIpP7TTcohR4unL4OONSpbHCM8S9vuylKTdJl8cEhEsE+jlScFOIPzWp4UjbgFIYVVos
 +8FNq1szmR6kkvobVtHQrZl3J3549As7x9LYqKFc6ToOIJMO+9THiLCZ4uS/CWaMA1pL
 6Pb2VgNgLx7bxa6TfY34sm6wcfZoBl+zb9/RKXc4j54vUKKJMxoXXhisUMWmf98VGnJP
 PUBhbxlcx8CobAuDA05QCAgn+VTCOixOR6lgDDd3bX2tGJmJc93gLRJeHlpwOR7yQFB5
 zhDQ==
X-Gm-Message-State: AHYfb5jIgAXfqL0C5PH9RmavwUa4trmeg2LFPjZiy3RHMiltNMJRDQZW
 XwwIpyHHiIOFptFTeScXGSIFMTJFog==
X-Received: by 10.25.202.74 with SMTP id h10mr8009314lfj.85.1502685219443;
 Sun, 13 Aug 2017 21:33:39 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.72.77 with HTTP; Sun, 13 Aug 2017 21:33:19 -0700 (PDT)
In-Reply-To: <1502474608-2674-4-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502474608-2674-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1502474608-2674-4-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Aug 2017 14:03:19 +0930
X-Google-Sender-Auth: Amd-X8x_HwzxQZqsTCmvYxv-uHA
Message-ID: <CACPK8Xee32=f0pDV40NSBKffTqAJz5DXeCBgEH-Af_jyo8EYVA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 3/4] hwmon: (pmbus): Add generic alarm
 bit for iin and pin
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 14 Aug 2017 04:33:43 -0000

On Sat, Aug 12, 2017 at 3:33 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Add PB_STATUS_INPUT as the generic alarm bit for iin and pin. We also
> need to redo the status register checking before setting up the boolean
> attribute, since it won't necessarily check STATUS_WORD if the device
> doesn't support it, which we need for this bit.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

I have merged the upstream commit
(cbcdec6202c934bd72fca4fe9db255d84f907dbe) into dev-4.10.

Cheers,

Joel
