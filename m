Return-Path: <SRS0=e831=PA=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E276C433F5
	for <openbmc@archiver.kernel.org>; Tue, 12 Oct 2021 09:46:45 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCD8861056
	for <openbmc@archiver.kernel.org>; Tue, 12 Oct 2021 09:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CCD8861056
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HT9mM1xwgz2yN6
	for <openbmc@archiver.kernel.org>; Tue, 12 Oct 2021 20:46:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=fCytKORa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12e;
 helo=mail-lf1-x12e.google.com; envelope-from=wak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=fCytKORa; dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HT9lX5Sm9z2xtS
 for <openbmc@lists.ozlabs.org>; Tue, 12 Oct 2021 20:45:58 +1100 (AEDT)
Received: by mail-lf1-x12e.google.com with SMTP id z11so76419727lfj.4
 for <openbmc@lists.ozlabs.org>; Tue, 12 Oct 2021 02:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2xStoWkvkLQalgtqhKrEqh7cArQAdMz+lrTw7tnSIMM=;
 b=fCytKORaKOPujDy8tG6WO2cs+PB0w9/p9dFE0kI27WhS8brLQIe0VCwhjSCmsyEzHp
 cGHChd2gtLD/8ZoNIxEIHs/HRlMN5MRhw2mr4my09UyW2ioTJN2iLfkdFilDTWEWz/x6
 ftlhBNAFltjtvcGLWDzDS2S2Y3OeDdv06XbL2BNP9Wbb0cdvSu0cs9XrJ644xlT3k3eC
 CSKSqA5jywM94GjFIk9qkCbXUHteAlTEQOdfEWElMY0tWladpphXLrJaRVd95ArkxaFZ
 Cq4jVLChj66hXnsiN1XjumZqEQgqCLkF1a3H+BWhmvqe6BsEVeR/Z/MR8DqhXQf613Nn
 pi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2xStoWkvkLQalgtqhKrEqh7cArQAdMz+lrTw7tnSIMM=;
 b=r80F3hDEOS/wxEY4/e3R2CqiSl30gr2B/7ZUdvhSLwov0YjB0P+j9FtOtqpCIT0V03
 Q6vb7djdo0yLADHVdfYZoFeLEcPQEXS4A+A7p/aHHifhp7G5yU/T9cH7PQiMc2CN5hK9
 T5Xgym/G+V2IKmYyf/2MkMq+SvNke6v5XFYmNfNos+K0iJX+UftEfjRehrFkEoj0tOlA
 jNx3YPaIzSi2QUjdY1AP5QdBB31/wzXd9wDOzlL1UChq8Iijig7psq+Zi5pFtgxEsn/W
 j0AJMprRaV8Uhc3qvZApdqXOkbS47UP+whvm3HPr91ZZ/L6mc46GNGC5XOUYB8zolKyY
 VM1A==
X-Gm-Message-State: AOAM533ofbxQPzkqSz/ABmWdT5WUGDjIQYr5FEOG0SUURXq3Za+/N1Xo
 y1fSdWFIomSpWhiZaAD6YWAwjd3cfvUYTjPLE4qgcA==
X-Google-Smtp-Source: ABdhPJxnaYD0ieq0UKkcUdD/saHZMc5FAkXcmX9glhpvG4PGIMEh25R1A0x61gvMcUEjd+q55gND9emneGWXwv3uORU=
X-Received: by 2002:a2e:a803:: with SMTP id l3mr27598955ljq.74.1634031946031; 
 Tue, 12 Oct 2021 02:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <E9902E4C-0786-400D-8920-9D1FDCBE001F@linux.ibm.com>
 <CAGm54UF4nADhYJPWjgr-ie3z2vGzW6aBvdsyQpJ4dsddgA3FLQ@mail.gmail.com>
In-Reply-To: <CAGm54UF4nADhYJPWjgr-ie3z2vGzW6aBvdsyQpJ4dsddgA3FLQ@mail.gmail.com>
From: William Kennington <wak@google.com>
Date: Tue, 12 Oct 2021 02:45:34 -0700
Message-ID: <CAPnigKnnvoiQyroWRyFc4Ps+AZ4XNyr5VsmuDwCOh=2YvHEE0g@mail.gmail.com>
Subject: Re: [External] Changing the os-release BUILD_ID back to its default
 value of DATETIME
To: Lei Yu <yulei.sh@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Personally I would rather have deterministic builds and don't like
arbitrary build timestamp injection into images. But we can announce
the plan to change this behavior and adjust build processes
accordingly.

On Mon, Oct 11, 2021 at 10:34 PM Lei Yu <yulei.sh@bytedance.com> wrote:
>
> On Tue, Oct 12, 2021 at 6:00 AM Adriana Kobylak <anoo@linux.ibm.com> wrot=
e:
> >
> > Hi,
> >
> > There has been some discussion in Discord on how to work around the "Sa=
me version" limitation during fw updates, and having a timestamp field that=
 could be used to generate a different version id (commit id plus timestamp=
 field) for every build seemed had positive support in the discussion.
>
> So the hash will be calculated as the `VERSION_ID` and `BUILD_ID` (as
> timestamp), is it?
> +1 for this proposal.
>
> --
> BRs,
> Lei YU
