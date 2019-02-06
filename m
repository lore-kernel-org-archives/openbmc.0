Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="u54FtXB5"; 
 dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43vmxC4Mv9zDqQT
 for <openbmc@lists.ozlabs.org>; Thu,  7 Feb 2019 03:24:31 +1100 (AEDT)
Received: by mail-ot1-x329.google.com with SMTP id e24so3548565otp.11
 for <openbmc@lists.ozlabs.org>; Wed, 06 Feb 2019 08:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=A5uMKZ9SjJdh4gW0t837tqJxNZJevbPqa301gmY7RJg=;
 b=u54FtXB51wSNaCtxr7G0dU5jBE3Peke/c2Wu8VpSy3zSSAQ+TMtxhAGRnmSxQ1k+va
 IfKeFKcKmlHbTVMuoxhPDSWp5PI3FCFCguN77JYOnqAnIJPxBU66Ee5YIYe+wkeEMHeg
 Mvck2bKuj34vnrAVjEaN5PRW0kC9LdfmwWvz7VAUG2g3qqMzZWmk16YWsm3Sla0eAXB1
 iqQZH8/B6W+oUcyAYUKGyWLt66881BEi4MiBA6DECTMhPhur/kaDxSrIEESdxOTURlEA
 xUUOYo/r2TeIfv//1VWpS5qfNTlcqptlXHWdwbiHRftzBtC6o0TRk5kUXVeefA85rT3w
 xuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=A5uMKZ9SjJdh4gW0t837tqJxNZJevbPqa301gmY7RJg=;
 b=I6bnvQZ1aePk7pOfEItGutSVEUQfk82BJHu424bDQR7fEBnJywwdZNRDJIdyQdKDFD
 CwZaBvcM24xoIMSlMY/t+1hPCF2K0X9IxehiVm67+7r+C210nz6kw4k+Cx+Y9Y1Dowe4
 iLgoRKauhfu7ONXEMmm7BOcbizUx2pRHB7olDA8DZi/ev69JJOb2z+uswxc6G3fHqpaZ
 qOoamKlhNK16gqECTW5opfg1smCaX9wjhlLA//3ZkorbIxUynrYmEJV3Xfb0fQAZAroV
 AKMY22J4PqW6JdGLxeNBi+V3gNDY3lyT5N0pXaO/q5m7zgNjZDq/npXeoSyen7IvvQ97
 uz1A==
X-Gm-Message-State: AHQUAubttD8LPXWcg71wmpLgKnwAvP43DY6LVRa5PN+pAtyHqZNqvkTW
 /avoSq4c4oxjP/pHUpxFccwkeIuMVf14zXswQblkQOJx
X-Google-Smtp-Source: AHgI3IYe0eL+qqEqqGWbAhbCUqyasygSXc3frfEpIRWCotQMRSKLLF7+Xw+gOu4hWoIhioMUdvJqkpWkwETvlmeXY8s=
X-Received: by 2002:a05:6830:1592:: with SMTP id
 i18mr266078otr.123.1549470268948; 
 Wed, 06 Feb 2019 08:24:28 -0800 (PST)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 6 Feb 2019 10:24:13 -0600
Message-ID: <CALLMt=oESi+1hxmaaVYvUhOP7oYpJgwJO=SVDNb0yiBb8+Y7TQ@mail.gmail.com>
Subject: Infrastructure Workgroup Today - CANCELLED
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 Adriana Kobylak <anoo@linux.vnet.ibm.com>,
 Kurt Taylor <kurt.r.taylor@gmail.com>, 
 Sai Dasari <sdasari@fb.com>, William Kennington <wak@google.com>, 
 Joseph Reynolds <jrey@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 06 Feb 2019 16:24:32 -0000

Not a ton of new topics and I've got a conflict so cancelling today.

https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Workgroup

Andrew
