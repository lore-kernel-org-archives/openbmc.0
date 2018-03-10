Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::234; helo=mail-ua0-x234.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="XAaFqh64"; 
 dkim-atps=neutral
Received: from mail-ua0-x234.google.com (mail-ua0-x234.google.com
 [IPv6:2607:f8b0:400c:c08::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zykv00T6tzF1vn
 for <openbmc@lists.ozlabs.org>; Sat, 10 Mar 2018 11:01:47 +1100 (AEDT)
Received: by mail-ua0-x234.google.com with SMTP id c14so3375766uak.7
 for <openbmc@lists.ozlabs.org>; Fri, 09 Mar 2018 16:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=LEFbqUKKOuYclazfAqR2EBqi1eVKpnufUT4MeBsvD0o=;
 b=XAaFqh64f7lEvLAzGYHmT01sPhKhbPlNm3WSZVxT8dy6nqKW8cs1en0Yu/Q5vc/6tY
 Q8lhAX/pBvMVooLqmKZEIm4GlT70+S90tUE8Sc8FWEJyLacHrShb8ZlDCWm0zbFNnFrm
 /4IX9J+CXU4Dgf353EAJaMyRROVSVfym5vOmRwzgFm117mYdVfLUfjcZ41F1crgE2z/G
 xoQAS+b80kKpTukjdNnURAIEV7CfBsvci5umJeDjo7mKq8djdNef5ww7WkBUf3/TOqQj
 wVZ65tnHhmMB1AJiyvoEfY7Fz7HQHcDJhQ0wih8Kqi9Pcc6uZKuvkmLOuu4jxItrRjsg
 F74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=LEFbqUKKOuYclazfAqR2EBqi1eVKpnufUT4MeBsvD0o=;
 b=BepHAA9bBs9ykectD9jMjN3boNHEZAUyXFBLkaZIe0yIbGTFm/afyVcJ+qQvYE+Tl9
 rt/tbfTrpS05SZRljwIrE9KKOZjfknbVxF3QD2+ZBCMfXP7+Zoprujq9GPyfGKedqiMo
 XV8f4ljAA9i+T7NKvn5nhI0OK1mqFLA+BhGwJNRneKTpotNvtQwteNraAIZsP+0nFNC4
 Y4LbEky4LhP+qy/UvNZr3PNjmr47tvzN0WcImO0eigX2p+jMneWE1sGHk9tEcoIR6UFn
 tSBTKiql1BStOi3mVh5cQbE87XBrqbp7TpNWnfgxnq7eE5UesK8dtGvNWln4MsU9FNny
 O+TA==
X-Gm-Message-State: AElRT7HjlUsXT5debX7vt0A5d7huY0MLW6FQ6vsyYJeMtIinvXpgXAm/
 3/xpBIqYvtdMnx+83VM0yfkFXwpLpdpf0rO0c+O+ZPWa3Oc=
X-Google-Smtp-Source: AG47ELstGxqUw7bEODjTY1WZQVHd/rO7C8ULwuAqlqJ4PjiGaWr57N7xBLKqeobo4cXnvnzT0CrtrSgZTwrsQWU6wC4=
X-Received: by 10.176.24.161 with SMTP id t33mr205200uag.198.1520640103547;
 Fri, 09 Mar 2018 16:01:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.58.79 with HTTP; Fri, 9 Mar 2018 16:01:23 -0800 (PST)
From: Patrick Venture <venture@google.com>
Date: Fri, 9 Mar 2018 16:01:23 -0800
Message-ID: <CAO=notykSOGC0DbHeY_4bZZ2oCw=rcpfT=kK3=0f-WSOOjFx+Q@mail.gmail.com>
Subject: Uploading firmware in-band
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Sat, 10 Mar 2018 00:01:48 -0000

I've pushed this for comments,
https://gerrit.openbmc-project.xyz/#/c/9497/1 - it's the BMC-side of
our implementation for receiving the BMC image.  It supports LPC, PCI,
and in-band IPMI as a transport mechanism.  it doesn't dig into the
signature stuff or the flashing portions, however it does assume there
is a signature verification service, and can receive the signature
itself.

Regards,
Patrick
