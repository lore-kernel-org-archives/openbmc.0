Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c06::234; helo=mail-io0-x234.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dFqDckjN"; 
 dkim-atps=neutral
Received: from mail-io0-x234.google.com (mail-io0-x234.google.com
 [IPv6:2607:f8b0:4001:c06::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yHVWB71YdzDqBH
 for <openbmc@lists.ozlabs.org>; Thu, 19 Oct 2017 11:42:14 +1100 (AEDT)
Received: by mail-io0-x234.google.com with SMTP id j17so8175817iod.5
 for <openbmc@lists.ozlabs.org>; Wed, 18 Oct 2017 17:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:to:cc:from:subject:in-reply-to;
 bh=XNhVprlk3xh5fkci99mk6UBp8y3KfhyNXo4kwG0Xjs8=;
 b=dFqDckjN+0wHlEVJSi0hDm5Kp51jBqQkGz5KM6LHADCMZnUUgPgfw0qCvDSSey950l
 R32NLKws3TYa+kprTcqKsJWsesxRQnAgChBXU8jRQDN/otz4PML6TTZ/lHjxLFN9ZIc4
 TsJooYBNL+XE9M6X48bLmyWAcBgQNYL/I0sioTGX4jdti21BmMOdBpUpJKTAAKYGdbfd
 25ExX5JhLqNWXWg8BOEFIjshg2yRWQzk+W1jrD/lg6qql2OW8VKfKMwIttZlhzfrVH3f
 HY4ahSRQcQ/MFmBHtFWeepwFOegtfjo5ROtKnaqwezKDymuoys+/ByW7buqoKznhI4XZ
 lACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:to:cc:from:subject:in-reply-to;
 bh=XNhVprlk3xh5fkci99mk6UBp8y3KfhyNXo4kwG0Xjs8=;
 b=VT6jWBMZhiSm1zWY4LTLV+SNIvadfkDnVUA+ZVy7QH9z60aCvbPjgp+v0Jve/cc4sf
 5FLqaQa0hZFmz12P1ObgMSOQhZzcAqBnWXDi5gfGZr4TlCc6pDBDZRITrrcof9xglrlm
 TaOfnN4NErbplQTNIIsVyGNl0nxVWno+8hGjjCNYMzZ+eNGTiYiRXchlBgCXeCVRxOX/
 S5ltaNaEhmMhSLmhYOZMxzC7B09C5o1J7IfWn654Ly3GZA9APSp+oqvUWNSPRoPwu5g5
 C604lHVPOTfY/V85wIuVzVzZzIvfQJTgkXh51kpLnA2QF1odsXlnyvfxD3uZiWTN4NAz
 EYKA==
X-Gm-Message-State: AMCzsaWRKz+noSg0ZjkwDBagVuj519GlBWYr9Aia193nIObKacC9EWaz
 WoMJKCssbSZ5lDHLF6QbnFbk1A==
X-Google-Smtp-Source: ABhQp+T8YHyGhsDkbQ5VSxWs+RwJhcQWOJ0Z+hZIQqrnCpoIxCrXFYHcqe5coYwZmqK270w1i2q44A==
X-Received: by 10.107.150.67 with SMTP id y64mr479834iod.74.1508373732246;
 Wed, 18 Oct 2017 17:42:12 -0700 (PDT)
Received: from mactruck.svl.corp.google.com
 ([2620:15c:2c5:3:61fb:ee5a:34c7:9b7d])
 by smtp.gmail.com with ESMTPSA id s81sm112088ita.19.2017.10.18.17.42.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Oct 2017 17:42:11 -0700 (PDT)
Received: from mactruck.svl.corp.google.com (localhost [127.0.0.1])
 by mactruck.svl.corp.google.com (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP
 id v9J0gA1q012247; Wed, 18 Oct 2017 17:42:10 -0700
Received: (from brendanhiggins@localhost)
 by mactruck.svl.corp.google.com (8.14.4/8.14.4/Submit) id v9J0gAEr012246;
 Wed, 18 Oct 2017 17:42:10 -0700
Date: Wed, 18 Oct 2017 17:42:10 -0700
Message-Id: <201710190042.v9J0gAEr012246@mactruck.svl.corp.google.com>
To: andrew@aj.id.au, joel@jms.id.au, bradleyb@fuzziesquirrel.com,
 yuenn@google.com
Cc: openbmc@lists.ozlabs.org
From: brendanhiggins@google.com
Subject: Re: Machine-scope maintainers for OpenBMC
In-Reply-To: 201710190015.v9J0FMXA004897@mactruck.svl.corp.google.com
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
X-List-Received-Date: Thu, 19 Oct 2017 00:42:15 -0000

Sorry for the spam. I was messing around with sendmail on my machine. I thought
the queue was broken, apparently it wasn't.
