-- ============================================
-- SEED DATA FOR GROOM'S WEDDING INVITATION
-- ============================================
-- This creates a separate wedding record for the groom's perspective
-- Uses the same Supabase database but different slug: "indra-indah"

-- Insert groom's wedding (from groom's perspective)
INSERT INTO weddings (
  id,
  user_id,
  slug,
  groom_name,
  groom_full_name,
  groom_father,
  groom_mother,
  bride_name,
  bride_full_name,
  bride_father,
  bride_mother,
  wedding_date,
  akad_date,
  akad_end,
  akad_venue,
  akad_address,
  akad_maps_url,
  resepsi_date,
  resepsi_end,
  resepsi_venue,
  resepsi_address,
  resepsi_maps_url,
  main_verse_arabic,
  main_verse_transliteration,
  main_verse_translation,
  main_verse_reference,
  quote_verse_arabic,
  quote_verse_translation,
  quote_verse_reference,
  primary_color,
  accent_color,
  cover_image_url,
  is_published,
  show_gift_registry,
  show_guest_list
) VALUES (
  'a3e7f899-fcd5-589e-b7ad-8b0766850cef',
  'b2d6e798-ebc4-478d-a69c-7a9655749bdc',
  'indra-indah',
  'Indra',
  'Indra Putra Pratama',
  'Mr. Budi Santoso',
  'Mrs. Siti Rahayu',
  'Indah',
  'Indah Permata Sari',
  'Mr. Agus Wijaya',
  'Mrs. Dewi Lestari',
  '2025-11-15',
  '2025-11-15 10:00:00+07',
  NULL,
  'Al-Akbar Grand Mosque',
  'Jl. Masjid Agung No.1, Jakarta Pusat, DKI Jakarta',
  'https://maps.google.com',
  '2025-11-15 10:00:00+07',
  NULL,
  'The Grand Ballroom',
  'Hotel Mulia, Jl. Asia Afrika, Jakarta Pusat, DKI Jakarta',
  'https://maps.google.com',
  'وَمِنْ آيَاتِهِ أَنْ خَلَقَ لَكُم مِّنْ أَنفُسِكُمْ أَزْوَاجًا لِّتَسْكُنُوا إِلَيْهَا وَجَعَلَ بَيْنَكُم مَّوَدَّةً وَرَحْمَةً',
  'Wa min aayaatihee an khalaqa lakum min anfusikum azwaajal litaskunoo ilaihaa wa ja''ala bainakum mawaddataw wa rahmah',
  'And among His signs is that He created for you mates from among yourselves, that you may dwell in tranquility with them, and He has put love and mercy between your hearts.',
  'Ar-Rum: 21',
  'وَخَلَقْنَاكُمْ أَزْوَاجًا',
  'And We created you in pairs.',
  'An-Naba: 8',
  '#1e3a5f',
  '#CD7F32',
  NULL,
  TRUE,
  TRUE,
  FALSE
);

-- Insert love story timeline (from groom's perspective)
INSERT INTO love_stories (wedding_id, date, title, description, icon, order_index) VALUES
('a3e7f899-fcd5-589e-b7ad-8b0766850cef', 'January 2020', 'First Meeting', 'We first met at a community gathering and shared a meaningful conversation.', 'sparkles', 0),
('a3e7f899-fcd5-589e-b7ad-8b0766850cef', 'June 2021', 'Growing Closer', 'Our friendship blossomed into something deeper and more beautiful.', 'star', 1),
('a3e7f899-fcd5-589e-b7ad-8b0766850cef', 'March 2023', 'The Proposal', 'With family blessings, a heartfelt proposal marked the beginning of our journey.', 'heart', 2),
('a3e7f899-fcd5-589e-b7ad-8b0766850cef', 'August 2024', 'The Engagement', 'Surrounded by loved ones, we celebrated our engagement ceremony.', 'gift', 3),
('a3e7f899-fcd5-589e-b7ad-8b0766850cef', 'November 2025', 'Our Wedding', 'The day we''ve been waiting for — joining our lives together.', 'party-popper', 4);

-- Insert gift registry (groom's bank accounts)
INSERT INTO gift_registry (wedding_id, type, account_name, account_number, bank_name, order_index) VALUES
('a3e7f899-fcd5-589e-b7ad-8b0766850cef', 'bank', 'Indra Putra Pratama', '1234567890', 'BCA', 0),
('a3e7f899-fcd5-589e-b7ad-8b0766850cef', 'ewallet', 'Indra', '081234567890', 'GoPay', 1),
('a3e7f899-fcd5-589e-b7ad-8b0766850cef', 'gift_item', NULL, NULL, NULL, 2);

-- Update gift item details
UPDATE gift_registry 
SET item_name = 'Kitchen Appliance Set',
    item_description = 'Help us start our new home with essential kitchen appliances',
    item_link = 'https://tokopedia.com'
WHERE wedding_id = 'a3e7f899-fcd5-589e-b7ad-8b0766850cef' AND type = 'gift_item';

-- Note: 
-- 1. This wedding uses slug "indra-indah" (different from bride's "demo")
-- 2. RSVP responses will be shared between both invitations (same wedding_id can be used if needed)
-- 3. Gallery photos should be uploaded separately via admin panel
-- 4. Update desain-pria/.env with: VITE_WEDDING_SLUG=indra-indah
