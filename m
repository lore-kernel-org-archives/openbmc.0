Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::22d; helo=mail-qt0-x22d.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="GBz2K8HU"; 
 dkim-atps=neutral
Received: from mail-qt0-x22d.google.com (mail-qt0-x22d.google.com
 [IPv6:2607:f8b0:400d:c0d::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40WhTw3XvHzDqyL
 for <openbmc@lists.ozlabs.org>; Thu, 26 Apr 2018 12:53:56 +1000 (AEST)
Received: by mail-qt0-x22d.google.com with SMTP id z23-v6so29677640qti.5
 for <openbmc@lists.ozlabs.org>; Wed, 25 Apr 2018 19:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vXEhTx6AWaJu66SoQPW7gjfUV5H7JlquqGv6ry9difk=;
 b=GBz2K8HUY1V/Q9YxkvEsDfQ9pUxGbH1nssSHDvQgF8bowiXtKCQ5GeG9SF79Wky3NM
 E0cSlNFiquak8vXeEaJ6bFuXoYQAyVN9xmmmRxPX7Si0rf6NUIp/06H3bLfjHhOqV7NK
 rk5bc2gC1l+H/u74IllnuSXs4O5CUZZG7NFqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vXEhTx6AWaJu66SoQPW7gjfUV5H7JlquqGv6ry9difk=;
 b=k9mNLcXJNzs8IEmuQugmPEw0K7qOnZUxloQZ8Odan5Tc5pWrTGzaRIGWB25YVrAyed
 X+aTSUqtHycol3M58GnRHkXe57dzmU1H1GxnRigAm6b//VgT9svKt7EHqLtTC4znx2cc
 /d+2484D7oyyqA6WUuRyqECoYsDEGoDPxd7SRNFBJHthdO4U6SoFWHRtKbR87pcS/6aT
 +RAFVssNKkDebx5Zl7BhwavhZBLcfIRTj3go2DWXs9457rSqMXBeSp2AeHLPEPUWTzQ2
 gUixawSi8fjp8S6gkjM6HDQ+fU4KklzGeqTC5avGe4uXVQ0+Tgpwx9UpHD2M9zA+DPw7
 0RWw==
X-Gm-Message-State: ALQs6tDxL6/RK+fdfXxUrAhZcr249zARF5D5EhPssOTe9emK9PGOp1Yd
 C+B/lN/Kjx/60xm0Om7rwZOmRvlTDbqhml3LiJU=
X-Google-Smtp-Source: AB8JxZrDOMJPNWlwXjN7tuoxtmsPDQNNqHxOTguGNppO5sdO6pv+3SaVETjn9muMnrtr3E/dsKrdiFwyZOjOunRcndE=
X-Received: by 10.12.185.1 with SMTP id u1mr10598746qvf.21.1524711233750; Wed,
 25 Apr 2018 19:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <1523432542-445334-1-git-send-email-yang.brianc.w@inventec.com>
 <1523584666.2655983.1336387696.46B4368A@webmail.messagingengine.com>
 <39E6480C5A587146BAA4D885C7BCF7EEC6B7921E@IEC1-EX2010-MX4.iec.inventec>
 <CAAvYUAw1ZH2DFrMr8mJydfQUVHatioxeNrOitwy4KU8fG5fuYA@mail.gmail.com>
 <1523930744.402617.1340420568.34CE3271@webmail.messagingengine.com>
 <CACPK8XeRZ_NbaduF-jbPoSA+-HO6O4Zoy3M1-geqkhkyohq6ag@mail.gmail.com>
 <1524101765.2367494.1343094608.58E4CC87@webmail.messagingengine.com>
In-Reply-To: <1524101765.2367494.1343094608.58E4CC87@webmail.messagingengine.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Apr 2018 02:53:43 +0000
Message-ID: <CACPK8Xf0NmA+9tO7LZ3R44vRLKd8S7YVNGfJ=qgdONvcYaheJw@mail.gmail.com>
Subject: Re: FW: [PATCH linux dev-4.13 v1] ARM: dts: aspeed: Add Inventec
 Lanyang BMC
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Brian Yang <yang.brianc.w@inventec.com>, Ken Chen <Chen.KenYY@inventec.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Lei YU <mine260309@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Apr 2018 02:53:57 -0000

On Thu, 19 Apr 2018 at 11:06, Andrew Jeffery <andrew@aj.id.au> wrote:

> Acked-by: Andrew Jeffery <andrew@aj.id.au>

Applied to dev-4.13.

Cheers,

Joel
