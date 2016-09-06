Return-Path: <vishwa@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sT0w32hhWzDrqL
 for <openbmc@lists.ozlabs.org>; Tue,  6 Sep 2016 19:01:54 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u868vvJY035786
 for <openbmc@lists.ozlabs.org>; Tue, 6 Sep 2016 05:01:52 -0400
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 by mx0b-001b2d01.pphosted.com with ESMTP id 259rt2ex58-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 06 Sep 2016 05:01:52 -0400
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Tue, 6 Sep 2016 19:01:48 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 6 Sep 2016 19:01:45 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: vishwa@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 3C9232BB0055
 for <openbmc@lists.ozlabs.org>; Tue,  6 Sep 2016 19:01:45 +1000 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u8691jiG7012654
 for <openbmc@lists.ozlabs.org>; Tue, 6 Sep 2016 19:01:45 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u8691iWM016782
 for <openbmc@lists.ozlabs.org>; Tue, 6 Sep 2016 19:01:44 +1000
Received: from [9.109.51.113] ([9.109.51.113])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u8691hZo016723; Tue, 6 Sep 2016 19:01:43 +1000
Subject: Re: Document on : Time Manager in OpenBMC --> Need your review.
To: Rick Altherr <raltherr@google.com>
References: <c91f438b-8baa-808c-35d6-fffb928d22f1@linux.vnet.ibm.com>
 <CAPLgG=koY4pB-kc=2eVCg5+CWVAVHdEN=SWwyBjK+4Bx7cPhyg@mail.gmail.com>
 <64e2267a-cbd5-0ebb-bdf9-a48c5af52e64@linux.vnet.ibm.com>
 <CAPLgG=nXS87g8cnkb3ZG0rxxTWarcowMc4gyhJx1KotRz_8uFw@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Tue, 6 Sep 2016 14:31:43 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAPLgG=nXS87g8cnkb3ZG0rxxTWarcowMc4gyhJx1KotRz_8uFw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------F0EEDBCB1AE4B3AACD428AC7"
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16090609-0016-0000-0000-000001C8A065
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16090609-0017-0000-0000-0000055D85F8
Message-Id: <e1352720-24c0-30b8-53fd-a1935358e1bd@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-09-06_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=2
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1609060140
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Sep 2016 09:01:55 -0000

This is a multi-part message in MIME format.
--------------F0EEDBCB1AE4B3AACD428AC7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

hello Rick,

Sorry on the delay. Please find my comments.


On 08/25/2016 10:49 PM, Rick Altherr wrote:
>
>
> On Thu, Aug 25, 2016 at 4:59 AM, vishwa <vishwa@linux.vnet.ibm.com 
> <mailto:vishwa@linux.vnet.ibm.com>> wrote:
>
>     Rick,
>
>     Thanks for the thoughts. I have put my response in-line. Please
>     let me know if you have any feedback on this.
>
>
>     On 08/23/2016 05:14 AM, Rick Altherr wrote:
>>     In the future, please just send the text inline instead of as an
>>     attachment.
>>
>>     I don't understand the setting hierarchy.  To me,
>>     /org/openbmc/settings/Host/host0 implies I am modifying something
>>     related to the host CPU, not the BMC.  TimeMode only applies to
>>     the BMC so having it under host0 feels weird.
>>
>     Agree. Doing this in 'host0' is not appropriate. However, the
>     current 'settingsd' framework does not allow multiple levels since
>     the need until now was only for 'host'. Now that we have a
>     requirement to get something new, I have suggested a change to
>     have another entry called 'bmc' and that work will be taken in
>     future sprints. So when that change is made, I will make a
>     corresponding change to clock as well.
>>     1. I like the clear separation of NTP vs manual.
>>
>>     2.1. "Both" seems like what we have today which doesn't really
>>     work at all.  I suggest omitting it.  "Split" feels like it
>>     should work for all cases.  If TimeMode is NTP, an offset is
>>     recorded.  If TimeMode is Manual, the BMC time is set.
>>
>     We had one of the customers ask for "Both" and that is why we are
>     putting this in there.
>
>
> What are they expecting in terms of behavior?  "Both" has the host and 
> BMC fighting for ownership of the BMC system time which has quirky 
> behavior.
One of the OpenPower customers had specifically requested for this. I 
will dig into what the expectation from them was and let you know.
>
>     For the *split* mode, whether it is NTP / Manual, it still demands
>     an update to offset.
>
>
> In "Split" with Manual, the BMC time is meant to be set from the 
> host.  In that case, the offset can be assumed to be zero and the BMC 
> clock set to the provided time.
In my view, Only when the time mode is set to "HOST", the BMC time is 
meant to be set from the host. In the case of split, BMC can choose to 
maintain its own time. The host time requests are handled as offsets 
into BMC's time.
>
>
>>     APIs:
>>     1. What time zone does SetTime assume?  If UTC, make sure to add
>>     tests for a valid leap second and leap year.
>
>     It does not handle Time Zones. Its a mere seconds since epoch.
>     Okay.. I will add the tests.
>
>
> Seconds since epoch != UTC.  Specifically for a leap second event, a 
> single POSIX time point is used for both 23:59:60 and the following 
> 00:00:00.  If the API is supposed to be UTC, specifically state that 
> in the API. If it's supposed to be a POSIX time, have them provide a 
> 64-bit integer.
>
>
>>     2. I really dislike APIs that change behavior.  Provide separate
>>     GetBmcTime and GetHostTime APIs if you must.
>     I like this idea. Implemented it.
>>     3. SetNTP is a very limiting name.  if this really changes
>>     TimeMode, call it SetTimeMode. That way we can support things
>>     like 1588, GPS, etc later.
>
>     I have changed the way NTP setting gets set completely. There will
>     not be an exposed API to change NTP setting. The changes that are
>     done to 'time_mode' will be picked up automatically by the daemon
>     and then appropriate services are started / stopped.
>>
>>     Changes to NetworkManager:
>>     - I don't see the point of UseNTP for SetDHCP.  Configuring an
>>     NTP address is different from using NTP as a time source.  It's
>>     up to the DHCP server to provide NTP options. Whether the BMC
>>     uses them is controlled by TimeMode.
>     The only reason I wanted this in there is if someone wants to take
>     a call to put NTP choice in there while changing the BMC
>     networking to DHCP, they can do it right then and there than
>     having to make another call.
>
>
> I'm hearing that you are optimizing for a case that we don't know is 
> important to optimize for.  BMC networking settings are conceptually 
> unrelated to time settings. Combining them in the API adds a lot more 
> complexity as all the places the NTP settings can be modified needs to 
> be considered.
I kind of agree with your thoughts. In my patch-set, I have removed 
these options from SetAddress4 and SetDHCP.
>
>
>     In addition to this, there are 2 parts to having NTP as TimeMode.
>     (1) We can let timesyncd choose NTP settings that have been given
>     by DHCP
>     (2) Let timesyncd choose NTP settings that were manually entered
>     using "SetNtpAddress"
>
>
> Both of those cases can be handled with a single SetNtpAddress API.
#1 is actually a setting that the user can manipulate and the time 
daemon reacts to that change and hence the need of 2 API.
>
>
>>     - Add a SetNtpServer API instead of adding to SetAddress4.  NTP
>>     is entirely separate from IPv4 address configuration.
>     I do have SetNtpServer and the reason I also chose to make it a
>     part of SetAddress4 was the exact same reason I mentioned for the
>     UseNTP= for DHCP.
>>
>>     On Thu, Aug 18, 2016 at 4:08 AM, vishwa
>>     <vishwa@linux.vnet.ibm.com <mailto:vishwa@linux.vnet.ibm.com>> wrote:
>>
>>         Team,
>>
>>         Please help look into this document that describes what I
>>         think the TimeManager on openBMC systems should look like.
>>
>>         Please weigh in your thoughts.
>>
>>         Thanks.
>>
>>         Vishwanath.
>>
>>         _______________________________________________
>>         openbmc mailing list
>>         openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>
>>         https://lists.ozlabs.org/listinfo/openbmc
>>         <https://lists.ozlabs.org/listinfo/openbmc>
>>
>>
>
>


--------------F0EEDBCB1AE4B3AACD428AC7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><font size="+1">hello Rick,</font></p>
    <p><font size="+1">Sorry on the delay. Please find my comments.</font><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 08/25/2016 10:49 PM, Rick Altherr
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAPLgG=nXS87g8cnkb3ZG0rxxTWarcowMc4gyhJx1KotRz_8uFw@mail.gmail.com"
      type="cite">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Thu, Aug 25, 2016 at 4:59 AM,
            vishwa <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:vishwa@linux.vnet.ibm.com" target="_blank">vishwa@linux.vnet.ibm.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div bgcolor="#FFFFFF" text="#000000">
                <p><font size="+1">Rick,</font></p>
                <p><font size="+1">Thanks for the thoughts. I have put
                    my response in-line. Please let me know if you have
                    any feedback on this.</font><br>
                </p>
                <span class=""> <br>
                  <div class="m_-5857520047155842178moz-cite-prefix">On
                    08/23/2016 05:14 AM, Rick Altherr wrote:<br>
                  </div>
                  <blockquote type="cite">
                    <div dir="ltr">In the future, please just send the
                      text inline instead of as an attachment.
                      <div><br>
                      </div>
                      <div>I don't understand the setting hierarchy.  To
                        me, /org/openbmc/settings/Host/<wbr>host0
                        implies I am modifying something related to the
                        host CPU, not the BMC.  TimeMode only applies to
                        the BMC so having it under host0 feels weird.</div>
                      <div><br>
                      </div>
                    </div>
                  </blockquote>
                </span> Agree. Doing this in 'host0' is not appropriate.
                However, the current 'settingsd' framework does not
                allow multiple levels since the need until now was only
                for 'host'. Now that we have a requirement to get
                something new, I have suggested a change to have another
                entry called 'bmc' and that work will be taken in future
                sprints. So when that change is made, I will make a
                corresponding change to clock as well.<span class=""><br>
                  <blockquote type="cite">
                    <div dir="ltr">
                      <div>1. I like the clear separation of NTP vs
                        manual.</div>
                      <div><br>
                      </div>
                      <div>2.1. "Both" seems like what we have today
                        which doesn't really work at all.  I suggest
                        omitting it.  "Split" feels like it should work
                        for all cases.  If TimeMode is NTP, an offset is
                        recorded.  If TimeMode is Manual, the BMC time
                        is set.</div>
                      <div><br>
                      </div>
                    </div>
                  </blockquote>
                </span> We had one of the customers ask for "Both" and
                that is why we are putting this in there.<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>What are they expecting in terms of behavior?  "Both"
              has the host and BMC fighting for ownership of the BMC
              system time which has quirky behavior.</div>
          </div>
        </div>
      </div>
    </blockquote>
    One of the OpenPower customers had specifically requested for this.
    I will dig into what the expectation from them was and let you know.<br>
    <blockquote
cite="mid:CAPLgG=nXS87g8cnkb3ZG0rxxTWarcowMc4gyhJx1KotRz_8uFw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div bgcolor="#FFFFFF" text="#000000"> For the *split*
                mode, whether it is NTP / Manual, it still demands an
                update to offset.</div>
            </blockquote>
            <div><br>
            </div>
            <div>In "Split" with Manual, the BMC time is meant to be set
              from the host.  In that case, the offset can be assumed to
              be zero and the BMC clock set to the provided time.</div>
            <div> </div>
          </div>
        </div>
      </div>
    </blockquote>
    In my view, Only when the time mode is set to "HOST", the BMC time
    is meant to be set from the host. In the case of split, BMC can
    choose to maintain its own time. The host time requests are handled
    as offsets into BMC's time.<br>
    <blockquote
cite="mid:CAPLgG=nXS87g8cnkb3ZG0rxxTWarcowMc4gyhJx1KotRz_8uFw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div bgcolor="#FFFFFF" text="#000000"><span class=""><br>
                  <blockquote type="cite">
                    <div dir="ltr">
                      <div>APIs:</div>
                      <div>1. What time zone does SetTime assume?  If
                        UTC, make sure to add tests for a valid leap
                        second and leap year.</div>
                    </div>
                  </blockquote>
                  <br>
                </span> It does not handle Time Zones. Its a mere
                seconds since epoch. Okay.. I will add the tests.</div>
            </blockquote>
            <div><br>
            </div>
            <div>Seconds since epoch != UTC.  Specifically for a leap
              second event, a single POSIX time point is used for both
              23:59:60 and the following 00:00:00.  If the API is
              supposed to be UTC, specifically state that in the API. 
              If it's supposed to be a POSIX time, have them provide a
              64-bit integer.</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div bgcolor="#FFFFFF" text="#000000"><span class=""><br>
                  <blockquote type="cite">
                    <div dir="ltr">
                      <div>2. I really dislike APIs that change
                        behavior.  Provide separate GetBmcTime and
                        GetHostTime APIs if you must.</div>
                    </div>
                  </blockquote>
                </span> I like this idea. Implemented it.<span class=""><br>
                  <blockquote type="cite">
                    <div dir="ltr">
                      <div>3. SetNTP is a very limiting name.  if this
                        really changes TimeMode, call it SetTimeMode. 
                        That way we can support things like 1588, GPS,
                        etc later.</div>
                    </div>
                  </blockquote>
                          <br>
                </span> I have changed the way NTP setting gets set
                completely. There will not be an exposed API to change
                NTP setting. The changes that are done to 'time_mode'
                will be picked up automatically by the daemon and then
                appropriate services are started / stopped.<span
                  class=""><br>
                  <blockquote type="cite">
                    <div dir="ltr">
                      <div><br>
                      </div>
                      <div>Changes to NetworkManager:</div>
                      <div>- I don't see the point of UseNTP for
                        SetDHCP.  Configuring an NTP address is
                        different from using NTP as a time source.  It's
                        up to the DHCP server to provide NTP options. 
                        Whether the BMC uses them is controlled by
                        TimeMode.</div>
                    </div>
                  </blockquote>
                </span> The only reason I wanted this in there is if
                someone wants to take a call to put NTP choice in there
                while changing the BMC networking to DHCP, they can do
                it right then and there than having to make another
                call.<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>I'm hearing that you are optimizing for a case that we
              don't know is important to optimize for.  BMC networking
              settings are conceptually unrelated to time settings. 
              Combining them in the API adds a lot more complexity as
              all the places the NTP settings can be modified needs to
              be considered. <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    I kind of agree with your thoughts. In my patch-set, I have removed
    these options from SetAddress4 and SetDHCP.<br>
    <blockquote
cite="mid:CAPLgG=nXS87g8cnkb3ZG0rxxTWarcowMc4gyhJx1KotRz_8uFw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div bgcolor="#FFFFFF" text="#000000"> <br>
                In addition to this, there are 2 parts to having NTP as
                TimeMode. <br>
                (1) We can let timesyncd choose NTP settings that have
                been given by DHCP <br>
                (2) Let timesyncd choose NTP settings that were manually
                entered using "SetNtpAddress"</div>
            </blockquote>
            <div><br>
            </div>
            <div>Both of those cases can be handled with a single
              SetNtpAddress API.</div>
          </div>
        </div>
      </div>
    </blockquote>
    #1 is actually a setting that the user can manipulate and the time
    daemon reacts to that change and hence the need of 2 API.<br>
    <blockquote
cite="mid:CAPLgG=nXS87g8cnkb3ZG0rxxTWarcowMc4gyhJx1KotRz_8uFw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div bgcolor="#FFFFFF" text="#000000"><span class=""><br>
                  <blockquote type="cite">
                    <div dir="ltr">
                      <div>- Add a SetNtpServer API instead of adding to
                        SetAddress4.  NTP is entirely separate from IPv4
                        address configuration.</div>
                    </div>
                  </blockquote>
                </span> I do have SetNtpServer and the reason I also
                chose to make it a part of SetAddress4 was the exact
                same reason I mentioned for the UseNTP= for DHCP.<span
                  class=""><br>
                  <blockquote type="cite">
                    <div class="gmail_extra"><br>
                      <div class="gmail_quote">On Thu, Aug 18, 2016 at
                        4:08 AM, vishwa <span dir="ltr">&lt;<a
                            moz-do-not-send="true"
                            href="mailto:vishwa@linux.vnet.ibm.com"
                            target="_blank">vishwa@linux.vnet.ibm.com</a>&gt;</span>
                        wrote:<br>
                        <blockquote class="gmail_quote" style="margin:0
                          0 0 .8ex;border-left:1px #ccc
                          solid;padding-left:1ex">Team,<br>
                          <br>
                          Please help look into this document that
                          describes what I think the TimeManager on
                          openBMC systems should look like.<br>
                          <br>
                          Please weigh in your thoughts.<br>
                          <br>
                          Thanks.<br>
                          <br>
                          Vishwanath.<br>
                          <br>
                          ______________________________<wbr>_________________<br>
                          openbmc mailing list<br>
                          <a moz-do-not-send="true"
                            href="mailto:openbmc@lists.ozlabs.org"
                            target="_blank">openbmc@lists.ozlabs.org</a><br>
                          <a moz-do-not-send="true"
                            href="https://lists.ozlabs.org/listinfo/openbmc"
                            rel="noreferrer" target="_blank">https://lists.ozlabs.org/listi<wbr>nfo/openbmc</a><br>
                          <br>
                        </blockquote>
                      </div>
                      <br>
                    </div>
                  </blockquote>
                  <br>
                </span></div>
            </blockquote>
          </div>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------F0EEDBCB1AE4B3AACD428AC7--
