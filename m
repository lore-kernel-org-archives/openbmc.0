Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x242.google.com (mail-vk0-x242.google.com
 [IPv6:2607:f8b0:400c:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vKxDz6CNRzDqBW
 for <openbmc@lists.ozlabs.org>; Sat, 11 Feb 2017 13:52:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sXS3dcHE"; 
 dkim-atps=neutral
Received: by mail-vk0-x242.google.com with SMTP id t8so4002211vke.0
 for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2017 18:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=RbxBFsUntTP1UwdqU0Jg1h1nxwSDDeygMPfr/O+MIJQ=;
 b=sXS3dcHEVbJLAbUFMMus0KQJMay02BaHEoACA6/dlSoz1qgeF1Jfv5/y5u7qA1LF+a
 WtWqfUKiFxnU4ZSC/uT6tj6a6CVfm5MeYySISLCXzRKz/cTR1ObERe5aiWWBlbffVGFL
 pCk+qxRPZBcuyhEeTXvuIILGj7M5tx+tOzhP32LrBXFtrzOaXbCoJsrgiATCtIAhI5Nm
 0g4wI4Zz3e4/ezusELByFJ4Z8fDwz2VvQ0vVcxqAK2tbphJ5uuFnAZ5iinh9iXFdiaG+
 fpQ6NkFeP5smtZaZh8IN19K8qSXbTScEeGuw7cqZpdOOFMz/WghVBRliEsEqDMXjzuMG
 LSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=RbxBFsUntTP1UwdqU0Jg1h1nxwSDDeygMPfr/O+MIJQ=;
 b=PSNpohyz1AB6t+qXnIfMwFPAA1vCE6Yq/v4XRZfCqaRfZ9zCiY12qEbXoFlZaTkHSD
 5heumocsHScH2yvKGa2Wpv/nbO4oH9/LcE3GlyIGA3blu2XciaL0uWszOA9HICXZ5tIt
 uwERYXpGm/9DAo7VF1bgpvAHwG/w7U0AXZYM5sxfWb/fw7DwGfsG8wsY1ijR/kP/tUKe
 FiJBn1lx90OebS+Po5gtKZ95kG1xEQP98pHQMtV7AflL57keD6jW6Oqveegin64reYDt
 rv3ia3r5LJHiJZptovCLc3lnje+4PRAVBI6WzOMDgQN+StmOpcC+h17k59ZJAOBqKolB
 cERw==
X-Gm-Message-State: AMke39lnSlWXgXKZuL3UR5o1aiiYcApOd8B58gTqpWXclXXI6aZ0QNXHTCagkjwqi/dGimStM6gfrjO1572QcA==
X-Received: by 10.31.6.69 with SMTP id 66mr3547528vkg.149.1486781553034; Fri,
 10 Feb 2017 18:52:33 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.92.150 with HTTP; Fri, 10 Feb 2017 18:52:12 -0800 (PST)
In-Reply-To: <20170210143012.GB18321@kroah.com>
References: <20170207234247.19425-1-cyrilbur@gmail.com>
 <20170210143012.GB18321@kroah.com>
From: Joel Stanley <joel@jms.id.au>
Date: Sat, 11 Feb 2017 13:22:12 +1030
X-Google-Sender-Auth: 7BhokybGLNzA9TXirjN0KQRzquA
Message-ID: <CACPK8Xczd8R0BsQ3HMjDhp8okr9VVMx38PTvHYinCTM=N=LQtw@mail.gmail.com>
Subject: Re: [PATCH v4] drivers/misc: Add Aspeed LPC control driver
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Cyril Bur <cyrilbur@gmail.com>, linux-kernel@vger.kernel.org, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Neuling <mikey@neuling.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Sat, 11 Feb 2017 02:52:36 -0000

Hey Greg,

On Sat, Feb 11, 2017 at 1:00 AM, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Wed, Feb 08, 2017 at 10:42:47AM +1100, Cyril Bur wrote:
>> In order to manage server systems, there is typically another processor
>> known as a BMC (Baseboard Management Controller) which is responsible
>> for powering the server and other various elements, sometimes fans,
>> often the system flash.
>
> Without some other reviewed-by: or at least tested-by lines here, I'm
> not going to take this.  Go poke your fellow ppc people to do some work
> here, it shouldn't be up to me to do it for them :(

We're on it. Thanks for your review so far.

By the way, this is a driver for an ARM SoC, not a PPC chip.
Nevertheless I'm sure those PPC people will still give us a review or
two.

Cheers,

Joel
