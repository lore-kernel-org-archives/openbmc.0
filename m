Return-Path: <SRS0=JXsw=JK=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 925DFC433B4
	for <openbmc@archiver.kernel.org>; Tue, 13 Apr 2021 23:50:16 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9A4B611EE
	for <openbmc@archiver.kernel.org>; Tue, 13 Apr 2021 23:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9A4B611EE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKj5f2zSHz3bTx
	for <openbmc@archiver.kernel.org>; Wed, 14 Apr 2021 09:50:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=KxzcA97j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=KxzcA97j; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKj5870pyz2yxB
 for <openbmc@lists.ozlabs.org>; Wed, 14 Apr 2021 09:49:48 +1000 (AEST)
Received: by mail-qt1-x82c.google.com with SMTP id c6so14171848qtc.1
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 16:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gZYZwEfxHlQqsEAdmXcC5b1fSnV5sxca+dQzuo8+Qs4=;
 b=KxzcA97j/7PCkAb4lY0dT+RxgwSdW2L8mbD6fgbw5l/uIlnSzZNavcm4B/hcPwPtEp
 Z/QJUTS3+LTkQPoKRzb6Ety3YLwbWdsluUyu2uWNDVwv+nRrdlrZ8LOKaG8jD1DXybzT
 7PUYmuanubTry9iQU6D1Dlp5h5DtH38J8lwNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gZYZwEfxHlQqsEAdmXcC5b1fSnV5sxca+dQzuo8+Qs4=;
 b=m5WM/Ed0IawNGYI9hYq83JnozbcOG6/THjDskK9xjDOK73+wza/nRzKFE7GhdSdNPS
 6eA6tD2bWG5SXgh3E/2p/MpGWGkY9N7U51gtggRPQcnfcpCFlTMICf/Ap6ZAxUBgTgTB
 tB6r1XgQMjFcMT3Rs5/NXOjxEqE6X8XWUjuzk6Tgk+ul+UIIrOTBV/st908Ht2QyHjF6
 fbq/3zdQJJr4rECu3d799UZdzWzjXsHRt6WYwt44GT6UQSwa9Cf5HsuO3I2/qgtPA2Pn
 yWehz3fbY6rOZTPoC1rWTqgf+l4jth+GqS/0OUx9VSn3pO50h1rsHdSOQdhJogb+vyn0
 CKIg==
X-Gm-Message-State: AOAM530vpBvy0i2UreasgYDnO9/PMDKpOZbq60mFao1U11KCOFhUE4i7
 i/hGtvjutJtmg6/+l9I+dnnzTJ9+lOpm9tw9Vyz4MS5p
X-Google-Smtp-Source: ABdhPJwYKlaVT9fJ3xSezMiHfMhnB5L/bNy/aMLATuJS6NNmA+6MLxmnmVux54EhXtpgPzmetf8IoDWiXSw2x+dMCZo=
X-Received: by 2002:a05:622a:589:: with SMTP id
 c9mr7829665qtb.363.1618357786538; 
 Tue, 13 Apr 2021 16:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210413080755.73572-1-joel@jms.id.au>
 <20210413080755.73572-7-joel@jms.id.au>
 <614d2b33-087d-2dcd-c345-6a831bbc06f1@linux.vnet.ibm.com>
In-Reply-To: <614d2b33-087d-2dcd-c345-6a831bbc06f1@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Apr 2021 23:49:35 +0000
Message-ID: <CACPK8XdxNo_2AV-joZVKVhZn+Kwp8commfArpBVWg_9y+j_7fw@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 06/11] image-fit: use
 hashing infra
To: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Tue, 13 Apr 2021 at 12:38, Klaus Heinrich Kiwi
<klaus@linux.vnet.ibm.com> wrote:
>
>
>
> On 4/13/2021 5:07 AM, Joel Stanley wrote:
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >   common/image-fit.c | 16 +++++++++++++++-
> >   1 file changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/common/image-fit.c b/common/image-fit.c
> > index e64949dfa73d..b9c3d79b83e1 100644
> > --- a/common/image-fit.c
> > +++ b/common/image-fit.c
> > @@ -1135,9 +1135,22 @@ int fit_set_timestamp(void *fit, int noffset, time_t timestamp)
> >    *     0, on success
> >    *    -1, when algo is unsupported
> >    */
> > -int calculate_hash(const void *data, int data_len, const char *algo,
> > +int calculate_hash(const void *data, int data_len, const char *algo_name,
> >                       uint8_t *value, int *value_len)
> Is the API changing here, or you just needed the 'algo' variable name for something else?
> Are all callers OK with that?
>
> >   {
> > +     struct hash_algo *algo;
> > +
> > +     if (hash_lookup_algo(algo_name, &algo)) {
> > +             debug("Unsupported hash alogrithm\n");
> > +             return -1;
> > +     }
> > +
> > +     algo->hash_func_ws(data, data_len, value, algo->chunk_size);
> > +     *value_len = algo->digest_size;
> > +
> > +     return 0;
> > +
> > +#if 0
>
> Can you expand the rationale behind keeping this dead code around?

Good catch, I sent the wrong version of the patch. I'll send v2 with
the version that went upstream.
