Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="G4Tjuopy"; 
 dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42QmNH336CzDr6B;
 Thu,  4 Oct 2018 18:32:30 +1000 (AEST)
Received: by mail-qt1-x835.google.com with SMTP id e22-v6so1903807qto.6;
 Thu, 04 Oct 2018 01:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Etw5AdVS0moKLKdBsJGLIrgK6JI8wkHFQHItlrPBIjQ=;
 b=G4TjuopyKXCp03SqG6zC4UMMyX16aobxSM3bi5YyHYuVNigaIkCCO5IDby4SnFsSW3
 zkePxKM8XQquC0KSKkVg/zh13fyYJfP+QvUEPvVsRjtZ9S04ybcfEXdlRvkpFFEbPTt8
 EgZp5Fq9Ked0bXRi+6oCrCgYo7klL3AsKdddU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Etw5AdVS0moKLKdBsJGLIrgK6JI8wkHFQHItlrPBIjQ=;
 b=hRpVt4dVivPFxzffYxcRSLsYlnWo0Ms+gSN13gx75u2tAmEQiYDzT2gisrGDW9iKAJ
 Pc4lbefHn2Y8XI9cESxuPLR2vrwNBPFvp50Al0YqhRmHbUy8vOTEXMsgOErP+OeHTSOg
 1b/tRVpWVgQooSV/rC4HG0tjnFDrZnSyEs7T6ZoSkBcpAlncTcaEjtDdoCnvDDx457/G
 0NzqtfZ0uuJ1kYLyag/bkOoS3juUKzoZ796784WkX1vs8afvaqz8QffmZ0kXXIV/2v5O
 WvUe6VA7Bj7cFZ5k+8TK1kSDe2xFwH0nq+C+wxOh3nMz5hQJgeAG8UGGZkzYmKIgIEzN
 oMZA==
X-Gm-Message-State: ABuFfoi6wr+Ea1OBMJwqt4FPXznBJijFA4yhbVV19sAL0tz3xOmZoLfZ
 nbJ29oacacpR22bY0i+Gctlcgd8Jn/xnfvllf5s=
X-Google-Smtp-Source: ACcGV62Tlywvq78my1oaDC8caZsVv0HGfxDv4AtuP35v19CHOL4acuIesZyuTFSVArhLO2THBo+xgmcqFQDyOksyd8o=
X-Received: by 2002:a0c:d032:: with SMTP id
 u47-v6mr4464538qvg.245.1538641948330; 
 Thu, 04 Oct 2018 01:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <20181003223107.16133-1-jae.hyun.yoo@linux.intel.com>
 <20181003223107.16133-5-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20181003223107.16133-5-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 4 Oct 2018 10:32:17 +0200
Message-ID: <CACPK8XdTMfdw1Tu97oD7R7MXQKGHnA5A+SVfAA3RDkiTd_bawA@mail.gmail.com>
Subject: Re: [PATCH i2c-next v5 4/5] i2c: aspeed: Remove hard-coded bus
 timeout value setting
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Wolfram Sang <wsa@the-dreams.de>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>,
 linux-i2c@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 jarkko.nikula@linux.intel.com, James Feist <james.feist@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
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
X-List-Received-Date: Thu, 04 Oct 2018 08:32:33 -0000

On Thu, 4 Oct 2018 at 00:31, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> This commit removes hard-coded bus timeout value setting so that
> it can be set by i2c-core-base.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>
