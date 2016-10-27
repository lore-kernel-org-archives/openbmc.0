Return-Path: <alastair@au1.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t4DSQ39T1zDt4V
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 15:29:42 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u9R4TE3O096414
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 00:29:40 -0400
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 by mx0a-001b2d01.pphosted.com with ESMTP id 26b6c2gr6p-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 00:29:40 -0400
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Thu, 27 Oct 2016 14:29:38 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 27 Oct 2016 14:29:36 +1000
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id E902E2CE8046
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 15:29:35 +1100 (EST)
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u9R4TZ556226404
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 15:29:35 +1100
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u9R4TZ0K016620
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 15:29:35 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u9R4TZR7016615; Thu, 27 Oct 2016 15:29:35 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E5A79A019C;
 Thu, 27 Oct 2016 15:29:34 +1100 (AEDT)
Subject: Re: [PATCH 3/3] Add a unit test for RX8900 RTC (time functionality
 only)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, clg@koad.org
Date: Thu, 27 Oct 2016 15:29:34 +1100
In-Reply-To: <CACPK8XfW0VKNaN1dptzMaRQmvw02Uwab0wHcA+m4=cQReWEnTQ@mail.gmail.com>
References: <1477535233-7760-1-git-send-email-alastair@au1.ibm.com>
 <1477535233-7760-4-git-send-email-alastair@au1.ibm.com>
 <CACPK8XfW0VKNaN1dptzMaRQmvw02Uwab0wHcA+m4=cQReWEnTQ@mail.gmail.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102704-0016-0000-0000-000001E3CEEA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102704-0017-0000-0000-000005B72A2D
Message-Id: <1477542574.2176.90.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-10-27_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1610270077
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
X-List-Received-Date: Thu, 27 Oct 2016 04:29:42 -0000

On Thu, 2016-10-27 at 14:51 +1030, Joel Stanley wrote:
> > -         * This I2C device doesn't exist on the real board.
> > +         * These I2C devices doesn't exist on the real board.
> >           * We add it here (only on qtest usage) to be able to do a
> > bit
> >           * of simple qtest. See "make check" for details.
> >           */
> > -        i2c_create_slave((I2CBus *)qdev_get_child_bus(DEVICE(&s-
> > >soc.i2c[0]),
> > -                                                      "i2c"),
> > -                         "ds1338", 0x68);
> > +        I2CBus *i2c = (I2CBus *)qdev_get_child_bus(DEVICE(&s-
> > >soc.i2c[0]),
> > +                "i2c");
> > +        i2c_create_slave(i2c, "ds1338", 0x68);
> > +        i2c_create_slave(i2c, "rx8900", 0x32);
> 
> I'm not sure how upstream will take this.
> 
> Is there a reason you didn't add them to an aspeed board instead?
> 

We are currently missing the *_i2c_create and the associated
send/receive callbacks required to access the i2c bus from the test
framework. The structure of aspeed_i2c.c was different enough from
i2c_imx.c & i2c_omap.c that I need more familiarity with the code
before I could implement it myself.

-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819
