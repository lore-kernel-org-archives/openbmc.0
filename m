Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::231; helo=mail-lf0-x231.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hpMhxCcK"; 
 dkim-atps=neutral
Received: from mail-lf0-x231.google.com (mail-lf0-x231.google.com
 [IPv6:2a00:1450:4010:c07::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xrxxp35VmzDr4G
 for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2017 17:58:38 +1000 (AEST)
Received: by mail-lf0-x231.google.com with SMTP id c80so24250660lfh.0
 for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2017 00:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=isB/Pu8GZ8S9Jyl33wIRi1OMxcP95HSoVuCL5+2WkNw=;
 b=hpMhxCcKYJ+V6cMH7EmlkXU1eW66Miayw4Et6kbiRn5RAJlajy2MJnAYe6kj3RVmp3
 GQlmknueXbcwd0uz/ODM3M6PXiZ1FsVpHGN4P8kVFP3045A34D9gu2Yrk65zrnJDPfDL
 OtlGqe7i96IX4GYjYk6v8KD7GG5QASYH1e8EbQy4BnjTWDdVfmPHkXUfZf3e0c9ZLbUC
 NdUehcFy+qXDq8i0fXQf5kw26vQQnwaJGXsc/T14KF9yVnXXnzaFY76XD7/9VjEPAe7r
 Yn7ogR6p70Vc/iIdhR8vn4Zi2lg/C8faIOZLU7n0R4dnJoTho4pqIqM9o0LJTf+lvaO+
 Y0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=isB/Pu8GZ8S9Jyl33wIRi1OMxcP95HSoVuCL5+2WkNw=;
 b=G20S40fMj5DQJmWvvFH74eDpZ2JQotGf85o4ZRlXoUKcmnTXH9zQI9BgeL/b4H8v9H
 LGKq0RBDnbajioyME3+9isLPTpqV0q2kaOYvQQcKdkRTjH5uwlodDckubUSa9+pQwdUb
 YRDWbi/A3ablZlPD3STrV0A3vAComRMXtUGMVxz3+a8iLNzNuhEKg908xtbQukq77L8i
 VYTBLA3QQcCasnQT3xArvNVPeUVxdkvgBd3tpGECPAtrqCvaw+rodVfcW23N13VEsvRb
 iDAs8igiM/+7mF60jnVTd+9c0xZYNYyu1V/qYR/RDFENBOaHqR7cf4pNi35VF2e9b7/w
 nxYg==
X-Gm-Message-State: AHPjjUjUCK0DjPbwEeI4nioogIdcbW8tVZ8iHFe8sgQ7rYhSH8ZxqXws
 /DXb7cZPKbQtYJBcXhbkJXKqVpkJMQ==
X-Google-Smtp-Source: AOwi7QBXhvlcNhIrxqSAdfb0SKmY3msnfJFUOrYwfQJ9zFswoqx2YxWJzu4HDFYRL5DsWsY9SEMFQn4v0+mJ1UEZq74=
X-Received: by 10.25.23.38 with SMTP id n38mr5019328lfi.104.1505203115113;
 Tue, 12 Sep 2017 00:58:35 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.103.82 with HTTP; Tue, 12 Sep 2017 00:58:14 -0700 (PDT)
In-Reply-To: <20170907192103.36929-1-cbostic@linux.vnet.ibm.com>
References: <20170907192103.36929-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 12 Sep 2017 17:58:14 +1000
X-Google-Sender-Auth: Fvli0WEBKaXzBl10gp51ELB26UY
Message-ID: <CACPK8Xd3Ky1UF8tTge+RfLwcfWTXDM-y2H9iMnTSKiV7ysE10A@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] fsi: core: Remove more spam FSI prints to
 console
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 12 Sep 2017 07:58:39 -0000

On Fri, Sep 8, 2017 at 5:21 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Move the most noisy fsi prints to dev_dbg() to unclutter the console
> output.
>
> Example:
> [  484.610000]  slave@00:00: status: 0x84000500, sisc: 0x00040108
> [  484.610000]  fsi1: can't read slave 00:00 -5
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>

This appears to be the last of the dev_info's in the core. Good work.

Applied to dev-4.10.

Cheers,

Joel
