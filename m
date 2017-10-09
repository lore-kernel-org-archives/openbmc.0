Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::243; helo=mail-lf0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RofsKXM+"; 
 dkim-atps=neutral
Received: from mail-lf0-x243.google.com (mail-lf0-x243.google.com
 [IPv6:2a00:1450:4010:c07::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y9NZg615pzDqlv
 for <openbmc@lists.ozlabs.org>; Mon,  9 Oct 2017 12:54:03 +1100 (AEDT)
Received: by mail-lf0-x243.google.com with SMTP id 90so17499467lfs.13
 for <openbmc@lists.ozlabs.org>; Sun, 08 Oct 2017 18:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=UVbvRBd6Gc3RMKO4Tl2Ln+AGFg4xw1jOMyb82kmrzkk=;
 b=RofsKXM+VU7LuVYcT9wQYQwl3uCwLMD8LVP4T7GPF8ozq0NMH+qTuixasqEN7n06DN
 AVBxLnerlTrQD0hqgeMxuRu6bcla9jFXKj92prtmfHsvyLgUWoOp92s5dP0N5uq/69sQ
 9mszvhGgqZVuY/EWRc/7fdVyYE25AR2LNdL5pdQaz73XU+Lw+FSD3uIh3j6bU766EGk/
 /X9SemMNtTI8Gp7grI+tcTv7cTlmgz2lN5LbkFEYPEYu8lC8hPpZgmyJqNWia1Rmtu2+
 V5AFIEMDhNceQYcozAnMd6ntuOOtcF2p/VIKLfsM2aM6R/WFdG8lzE1F3Ji9T7hhjHWi
 Eq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=UVbvRBd6Gc3RMKO4Tl2Ln+AGFg4xw1jOMyb82kmrzkk=;
 b=eSDh5Ayb0mTXsee2+Vi47tnHwKR0SlOx1aLeyjdAFenuj+rwYjsb9nhw7TFWfLz/ko
 FEWy7ttJiRRxU09uJOhfvjUm7R0RXg80EG7QTL/U085LHmHdLSKprdHtE5xf89xwNLoB
 sM5C4lzTb+lrTV9R3wx9/C1U50I20FflfNxfW2kWSNixoJR6YX7a/f4Y4l/loB75jEsu
 2Jbf6jx3CSKwlzFqPRPXX/zSf0X04Pmpdhh5BkAWKPWtpNQrMckrS+2YB79vbMktHG+/
 RDCouZAKdIB45L1n++qA/4X0L8RdVx6dwORIAxiAe8YawaoPR8ocdiTLTsC/IFsIDhe8
 cZ4g==
X-Gm-Message-State: AMCzsaV3hZFLIYh3Z7tEZWwWx67X/VgU5L8GWKUMU2luUL1unCh3/8Fw
 ms/hblktOZCDhFQk3F68BJraC6P7z3YPgvUWy7Q=
X-Google-Smtp-Source: AOwi7QADBYalSa8u9hsIvLo9ONUuf5/dCFXgWhNacEOAusAwzeWjsDnTgi0RJJuSQSXTAv9Nx6vnrO4ysrmMLzVnqeo=
X-Received: by 10.25.143.78 with SMTP id r75mr3028193lfd.85.1507514038712;
 Sun, 08 Oct 2017 18:53:58 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.195.6 with HTTP; Sun, 8 Oct 2017 18:53:37 -0700 (PDT)
In-Reply-To: <9D069C32-9D7D-4D20-938A-AB9FF92E4ABC@fuzziesquirrel.com>
References: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507255553-13301-29-git-send-email-eajames@linux.vnet.ibm.com>
 <9D069C32-9D7D-4D20-938A-AB9FF92E4ABC@fuzziesquirrel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 9 Oct 2017 11:23:37 +0930
X-Google-Sender-Auth: YVt415ghLLzd11z_dCyOB6SJ8qo
Message-ID: <CACPK8XdFDN8VdidYsKKqhO5AKzgPBER-R6UHhF_VhqL_zyNTRw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v4 28/31] drivers: fsi: occ: Add cancel to
 remove() and fix probe()
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Eddie James <eajames@linux.vnet.ibm.com>, Andrew Jeffery <andrew@aj.id.au>,
 "Edward A. James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 09 Oct 2017 01:54:04 -0000

On Mon, Oct 9, 2017 at 10:35 AM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
>> On Oct 5, 2017, at 10:05 PM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>> -static void occ_enqueue_xfr(struct occ_xfr *xfr)
>> +static int occ_enqueue_xfr(struct occ_xfr *xfr)
>> {
>>       int empty;
>>       struct occ_client *client = to_client(xfr);
>>       struct occ *occ = client->occ;
>>
>> +     if (occ->cancel)
>> +             return -ECANCELED;
>
> Can we have ENODEV here?  That seems to be typical for this scenario and
> ECANCELED seems to be for canceled AIO operations.

I agree.

Eddie, I will fold this change in when I merge if you're okay with it?

Cheers,

Joel
