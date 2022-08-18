Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD3EC00140
	for <openbmc@archiver.kernel.org>; Thu, 18 Aug 2022 07:42:47 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7cLF36GTz3c7D
	for <openbmc@archiver.kernel.org>; Thu, 18 Aug 2022 17:42:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=QgKBDTg/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=QgKBDTg/;
	dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7cKX3Ryqz2xJJ
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 17:42:07 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id bs25so747359wrb.2
        for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 00:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=IRbivqtj1T/J1chMFWEqmV8av0y7Zwkobuwy6og+hOw=;
        b=QgKBDTg/nb8yjVh93YUBsMr7ldJ1GXZkoeuzFNbDwXS8ngXSUfNFlXKlvspmExtpnX
         AuULPyW9Dr/ovmf8MCvAVpWXNQYQnJSdSnhqKOF3YgHUjiO2sSVU74gjeIGNT3HRCeGL
         v/b1oaxaflvehYcBsV57KjdykZ8PvJE8J4iaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=IRbivqtj1T/J1chMFWEqmV8av0y7Zwkobuwy6og+hOw=;
        b=0FqF22uuFAeMhe8IHInqs5BCIA9+qtuwqfz0sWXdOnJlgxjZfTPIUjNjKROa66rXFo
         ydBMYXP8LhLQub1wGt2FgOLSEogrpFZjijDSrzZimUXxY2kBWVLLL1a1ao2C+sqGXJIU
         M4JE1FhJef9bLRt3nZmqssv/mURjqaZBR9vZDZ3J5PkWGtn7mMUMv9Bi6HxjkX4I9tfV
         FNVC91AOtLJDtwirWlnfZHl8P30mpx6zxISF/pJwhgreAKwtPr9w8F4/9tGvP/j6SRC9
         nVlJherTMQvxYKpst8lFOrlBlLIjmGh99b2uAUq1uueuDPEOONwC0a18Mo8spx+sPEF7
         bk1g==
X-Gm-Message-State: ACgBeo0W+1jiIW046H1dvJz2uYhr05qmfLU4KSpq1zSANQGqmHcwezOM
	DSOdVp945sHo0WZ6tUKCS4PjWDUMTRFp8nSQnlY=
X-Google-Smtp-Source: AA6agR7vHlvn8hgMTh7fAfRgMqmoKGNVC1ShTJnRV1thgjlzpuSbscgE9VfoGZ4weyAeGB/IPRzw5vPY4ovUXpo5aJc=
X-Received: by 2002:a05:6000:1ac8:b0:220:6af3:935d with SMTP id
 i8-20020a0560001ac800b002206af3935dmr836065wry.549.1660808523214; Thu, 18 Aug
 2022 00:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220228000242.1884-1-quan@os.amperecomputing.com> <f6c87af2-827f-7451-fe30-7ec1b62e5cee@os.amperecomputing.com>
In-Reply-To: <f6c87af2-827f-7451-fe30-7ec1b62e5cee@os.amperecomputing.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 18 Aug 2022 07:41:50 +0000
Message-ID: <CACPK8XdAUxSszm9-5Sugn7=m_Km-dcBH0_otLwfpVr7Db8Y_XA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.15 0/5] Enable second flash, update gpios pin
 and merge adc channels
To: Quan Nguyen <quan@os.amperecomputing.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Open Source Submission <patches@amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Thu, 18 Aug 2022 at 07:33, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>
> Dear Joel,
>
> Could you help review and backport this patch series to dev-5.15 branch?
>
> https://lore.kernel.org/linux-arm-kernel/20220228000242.1884-1-quan@os.amperecomputing.com/

Thanks for the reminder. That's done now.

Cheers,

Joel
