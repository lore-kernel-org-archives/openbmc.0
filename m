Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7084DC43334
	for <openbmc@archiver.kernel.org>; Fri, 22 Jul 2022 20:39:52 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LqLsL42MTz3bXn
	for <openbmc@archiver.kernel.org>; Sat, 23 Jul 2022 06:39:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QvX5Z7qQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QvX5Z7qQ;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LqLrZ0rkfz2yWr
	for <openbmc@lists.ozlabs.org>; Sat, 23 Jul 2022 06:39:08 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id o5-20020a17090a3d4500b001ef76490983so5160740pjf.2
        for <openbmc@lists.ozlabs.org>; Fri, 22 Jul 2022 13:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y/cLAAUgm6uZuDe2dLw/cJx2F0GhsZIn5H/0YtI6nXk=;
        b=QvX5Z7qQhNUMEe5AU2c+gjp3m0opEuVcXeVPUbXCcWWtqe5PhsZaMl+/66O21ofQZK
         iCjYEdJS2dI1FJ+57bPuCBaZj40wZe2mHqXkL8ghGn2clsJPm3D7LO42nWXKxkmk1+1J
         6HezEDDQhUU4/V1prpnbzzkxDNfd4OD3U/IqVIcaWfYcffNYdLsvPruof88D26toExDj
         TY/WeDAiVyT4MKiHpuNcYZc9Wsuo8FaVIO8AvQgpoOYa9/ssGC5kocISUt1fIx/NqhJg
         RmqBoyQCd/2HE5jJjCsRNCW2WhDD7Um/nnqex5quUPSz0OHmQUW6Ac9T9A3DtMsWdlZF
         woUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y/cLAAUgm6uZuDe2dLw/cJx2F0GhsZIn5H/0YtI6nXk=;
        b=3VBaG9BoWjxZ89faoPsmGspTXad4jKtketqaE09oQVva+NJeg8uGf0RHrz73FNqd4s
         I0sqWAzVpuamDmvp4etjkfKa/fxfiREuEYe3woIgLHQmCzsMZmdOwCpPM7pMzscxV+Lh
         7bYj3UUQzZe6hOIZE6MTeKCUsOhC/8RgSC1RLQH2ergV0sko9b1DlC9RQG3/KiWUeYUB
         efLm0YBnFV2Ic0LOH8zrnSql0yR/NluwMwJsdJzHNbUSrQA07I2nq7Tvos8/7SG0YgDA
         i4ygijiLb3h60+raquCQ+2/h5cbiMTZZLSmOQ3kq6HoaANszhX+MZF1Jtm16z3GnLvP9
         +ljA==
X-Gm-Message-State: AJIora8N4UByTnJ0L4S1eHQLAMI6rpq789o6TbOJjNH8UWdl9varLiCo
	+hpqLjaySDGRYSj0JhQCt/vyJorNTtWAIVfeHabP2A==
X-Google-Smtp-Source: AGRyM1swLh5cxQxnJdPkhWacS/vCzZi/PJhAH+JI2lnO/t3z6TMLTFkIAjYQSWc6JqLCgDoE+mo9pe+Z1sSz9Kv9QpE=
X-Received: by 2002:a17:90b:17c9:b0:1f0:5678:5142 with SMTP id
 me9-20020a17090b17c900b001f056785142mr1474722pjb.205.1658522343969; Fri, 22
 Jul 2022 13:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <fcf6043c-1d69-9681-6dea-629ad4dffade@linux.ibm.com>
In-Reply-To: <fcf6043c-1d69-9681-6dea-629ad4dffade@linux.ibm.com>
From: Ed Tanous <edtanous@google.com>
Date: Fri, 22 Jul 2022 13:38:51 -0700
Message-ID: <CAH2-KxBuPhrv3bBu3ihr1AW6jpLXWvhr3pY0a4zqdFw0eFKkbw@mail.gmail.com>
Subject: Re: BMCWeb support new HTTP headers Referrer-Policy and
 Feature-Policy renamed to Permissions-Policy
To: Joseph Reynolds <jrey@linux.ibm.com>
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
Cc: Krzysztof Grobelny <krzysztof.grobelny@intel.com>, openbmc <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>, nanzhoumails@gmail.com, Gunnar Mills <gmills@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Fri, Jul 22, 2022 at 1:32 PM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>
> BMCWeb maintainers,
>
> This is a request to add new HTTP headers.  Some of the newer dynamic
> security scanners are looking for the "new" HTTP headers and complain if
> they are not present.  The headers include:
> - Referrer-Policy
> - Permissions-Policy
> - Feature-Policy renamed to Permissions-Policy
>
> Should we support these in BMCWeb?

The answer to this is already documented in the bmcweb developing
guide.  We follow OWASP guidelines here, so I suspect the answer to
your question is "yes", but I haven't looked at the relevant
documentation for those headers specifically.

> Maybe as hard-coded response header.

Yep, this is how we do all the other security headers today.

> For example, for the Permissions-Policy, would we ever need to
> accelerometer or microphone?

"would we ever" doesn't matter here.  If we need them in the future,
we can change the permissions headers to allow them, the only thing we
care about is "do we use them today" for which the answer is no.
Because we don't have a valid use, those features can be disabled.

> When selecting the Referrer-Policy we should select secure default
> values, and also consider the Web GUI development scenario when the Web
> site is hosted off of the BMC.

While we should support the latter where we can, we have build options
that the development process uses, and the webui proxy is fully
capable of stripping headers where required.  With that said, I don't
think any of these would have an effect on running the webui remotely,
but certainly something to try.

>
> I am not an expert on HTTP headers and I do not know what values to
> use.

Nor are the bmcweb maintainers (mostly speaking for myself here);  We
start by reading the documentation provided by the relevant security
authorities and we follow the advice they give us

>  My purpose is to determine if these headers are useful (I believe
> they are) and update BMCWeb to set some sane values.


Cool, looking forward to the relevant documentation and the patch.

>
> Joseph
>
