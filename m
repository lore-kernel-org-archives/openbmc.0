Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::22d; helo=mail-lf0-x22d.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XaRzQrYa"; 
 dkim-atps=neutral
Received: from mail-lf0-x22d.google.com (mail-lf0-x22d.google.com
 [IPv6:2a00:1450:4010:c07::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yZFT11hrmzDrK8
 for <openbmc@lists.ozlabs.org>; Sun, 12 Nov 2017 11:46:28 +1100 (AEDT)
Received: by mail-lf0-x22d.google.com with SMTP id n69so14765068lfn.2
 for <openbmc@lists.ozlabs.org>; Sat, 11 Nov 2017 16:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=xJcxMxuNmfisEiCW/KB1X5SSF4OHZEMtf6FpqkQ3KK4=;
 b=XaRzQrYa2/Ma73xJwW2HLCExHsNUlob2/YtEq6Wc16aqWkIosR3oPmdlBIEsBOMnv/
 NlJJsu7b846lSW9NaD6Tyid2hhCl8UcMapI2M0IyZTaUHuGwsqQVX6CibPnMBxTE+roD
 MM4Tmbo2jMqXUDe71OwDZibVm6ZA5KhIKaOsBN9ywRIFT9JGbQ2A9SRxmK+u9lGIAJsB
 GuFNpEGSnYIOEJYt6zbUIeyTCpdXS8x3x+TyaWkkfnhH1aapr/BTyOVvMtpOGAo1Fjny
 oqhzQ/67bfHsWHMvMvT6ggUd2TIaLRW+3BJMhlrRibNHHXZrwIq890dr2Xu8fPLQoxlK
 6sSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=xJcxMxuNmfisEiCW/KB1X5SSF4OHZEMtf6FpqkQ3KK4=;
 b=XEP+oJWFqKiTZ3hU+x6aoBmk+ozVqVKpXfi9W92HC9wQvSd3Ml3Y65jgd8O7COOVoc
 35JiHOViiSujZTE/PES2Yqhx7g9NvDeOwrT/ToatCA7kcUjPHTY1HTAKT8Oii7OaaN9L
 8dLM5NtIDLHox0mk3cKUEUozQEu5xBbm4usGTMGH03MNRI2+Fp/14vRHHBh6qeRVmMWc
 c5GBrM7yrl5utXwZhXN0DYgtUfjxPtOcPbT57ecmEgIAPvsvNV45xNW8TDveCgwwfDHK
 pLTJiwE2RjiuasUs1DobDpH+8dWLFg4Vi/m6d9KEyAROEHD8+Whm8nQ5YjKM1CZjcqV7
 ncNA==
X-Gm-Message-State: AJaThX4EYQKRFo9OssxU6BmcCs7p6sTwApyF3BqIeYKvFmdIPGiiuvtg
 qOEpTdHmIae/wz1Hl5fXEEeON9iZlscUeUPyEiQ=
X-Google-Smtp-Source: AGs4zMbGk4wCKE1DDpfnbMAb3Jopjtua7tpqo3+Tj06gG2/9afmZH4VMx/zJDeN20zqsFysSs27zKHcf/z98uTZmOFg=
X-Received: by 10.46.56.14 with SMTP id f14mr2086114lja.46.1510447584326; Sat,
 11 Nov 2017 16:46:24 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.4 with HTTP; Sat, 11 Nov 2017 16:46:03 -0800 (PST)
In-Reply-To: <4322480B-15BC-4260-9D78-917E823CB8D8@fuzziesquirrel.com>
References: <4322480B-15BC-4260-9D78-917E823CB8D8@fuzziesquirrel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Sun, 12 Nov 2017 11:16:03 +1030
X-Google-Sender-Auth: u_mquupEPYdXHifDsQlSgdi90aE
Message-ID: <CACPK8XfeOVFEq6mRSL2DKOJazSvGSPYHrG6OtEtNi+EeWptvWg@mail.gmail.com>
Subject: Re: OpenBMC community telecom - call for 11/13 topics
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Sun, 12 Nov 2017 00:46:30 -0000

On Sat, Nov 11, 2017 at 1:22 AM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
> Please reply with any topics for the 11/13 call.

 - Moving to a new base kernel (4.13)

Cheers,

Joel
