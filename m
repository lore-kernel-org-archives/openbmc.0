Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::22f; helo=mail-lf0-x22f.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YZfvzaOY"; 
 dkim-atps=neutral
Received: from mail-lf0-x22f.google.com (mail-lf0-x22f.google.com
 [IPv6:2a00:1450:4010:c07::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y6NFT5JFPzDqln
 for <openbmc@lists.ozlabs.org>; Wed,  4 Oct 2017 15:28:45 +1100 (AEDT)
Received: by mail-lf0-x22f.google.com with SMTP id l23so5092418lfk.10
 for <openbmc@lists.ozlabs.org>; Tue, 03 Oct 2017 21:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=XcSOqstQu3Mbcb58N6JXBV5+H9jn36ysiUP0/SNEzLA=;
 b=YZfvzaOYg/oLXQVSUJC70guVUoBHux/pZjx4cA6NYoVaDU8uExdMIt6J8JPrhOW4d5
 KGI8M0coYp1SmiXsnw2coNE8PLYX5WbmV5DEKglKxFLyZn73ECOu0TxLNGdLDArriKNh
 f3VjAirHK0I7a/S6zOmrn9ZoEzvev30usJRBHtwkuQo+H45IO/p5IswGXgST/9qvSMW+
 c1ihegwZvYJfrlrOVHLXLuTgAPaHIMpxmPWwEIesJwGJ1oeonzaY/z8WZ+s0V2BBw2QM
 3BjIBcUnwFcO8EyEVkzCeFlZvH4uvjN7t56j3jko0VRk1GS91i8i8tupPDK5BZXkeOpa
 OEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=XcSOqstQu3Mbcb58N6JXBV5+H9jn36ysiUP0/SNEzLA=;
 b=pE+V5vnCYnhSs4wwv+7J89cKWncMvoHQi9OBx71kAydhHi69ZHBvVs4Hg5hHi4QW0N
 zCs0JZp6rhpWCpYcKVw0SK8W15Cc1c7xd90ogUuCpD5OYTfn8HP5N1QGNl+yZspA3D8O
 PGuFIeevSApQtHZm/KLBOXaMDbeze8nRLP3LHFqDB3Djr365anVhClSSVFNY+vP4yviL
 hTW14/d7yg3h9mBbHC103xNfXkt7Ifc4D7g12jXuwTagBQhYAGVrms9WvsESqou1hWQf
 7A1zvx5VrCsaiLhg2HSXoTzs1sFPw4loUVmXa4DHXRoVMax7NvQc+d5KTCh+RL1mhsuz
 a8Dg==
X-Gm-Message-State: AHPjjUiJ6MaodmBt55dl0eeRpSLiYsWtvoenTwmUCoPFwYEUZ6gOP5o3
 nQT7P+ERci5YFDoGlAybFNWu9SXr2qrc4THo4pA=
X-Google-Smtp-Source: AOwi7QCVg//V3AjnuukhfvFrF4yS+s+huaSJrUZH046cESaHpPXqi2uFEXfrbiS/nvmiEygLqd0fhR+DY7rn72P61Qs=
X-Received: by 10.46.86.146 with SMTP id k18mr10310139lje.81.1507091321636;
 Tue, 03 Oct 2017 21:28:41 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.195.6 with HTTP; Tue, 3 Oct 2017 21:28:21 -0700 (PDT)
In-Reply-To: <20171002182340.75268-1-cbostic@linux.vnet.ibm.com>
References: <20171002182340.75268-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 4 Oct 2017 13:58:21 +0930
X-Google-Sender-Auth: ugwnPVAr5NaumSTn-KEb9r3i8mo
Message-ID: <CACPK8Xdf9XbNSvzRK99t2UQfnh1qZY9UpoQ5Dgyumi_sNHCN0Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] fsi: core: Hold hub master reference until
 unregistration complete
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: Christopher Bostic <cbostic@us.ibm.com>,
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
X-List-Received-Date: Wed, 04 Oct 2017 04:28:46 -0000

On Tue, Oct 3, 2017 at 3:53 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> From: Christopher Bostic <cbostic@us.ibm.com>
>
> During the hub master unregister process there is a race condition
> where its memory can be freed before the entire unregister is
> complete.  To prevent this hold a reference until complete.
>
> Code provided by Jeremy Kerr <jk@ozlabs.org>
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>

I applied Jeremy's version with your tested-by tag.

Cheers,

Joel
